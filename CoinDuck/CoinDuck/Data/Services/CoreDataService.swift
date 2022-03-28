import Combine
import CoreData

extension CoreDataService {
  static let modelName = "Model"
  static let groupId = "group.nl.chipchip.CoinDuck"
  static let sharedPathName = "Model.sqlite"
  static let memoryPathName = "/dev/null"

  public enum StoreType: String {
    case persisted
    case memory
  }

  public enum StorageActor: String, CaseIterable {
    case app
    case widget
    case batchImport
    case test
  }
}

///
/// CoreDataService
///
public final class CoreDataService {
  // Public
  public lazy var viewContext: NSManagedObjectContext = {
    let viewContext = persistentContainer.viewContext
    viewContext.automaticallyMergesChangesFromParent = true
    viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    viewContext.transactionAuthor = StorageActor.app.rawValue
    viewContext.name = "viewContext"
    return viewContext
  }()

  public lazy var container: NSPersistentContainer = {
    persistentContainer
  }()

  // Init
  static let shared = CoreDataService()

  private let storeType: StoreType
  private let storageActor: StorageActor
  private let storeDescription: NSPersistentStoreDescription
  private let persistentContainer: NSPersistentContainer
  private let historyTracker: HistoryTracker

  private init(storeType: StoreType = .persisted, storageActor: StorageActor = .app) {
    print("CoreDataService init")
    self.storeType = storeType
    self.storageActor = storageActor
    self.storeDescription = NSPersistentStoreDescription()
    self.persistentContainer = NSPersistentContainer(name: CoreDataService.modelName)
    self.historyTracker = HistoryTracker(persistentContainer: persistentContainer, storageActor: storageActor)

    setupStorePath()
    enableHistoryTracking()
    loadPersistentStores()
    setupQueryGeneration()
  }
}

// MARK: - Actions

public extension CoreDataService {
  func saveContext() {
    if viewContext.hasChanges {
      do {
        try viewContext.save()
      } catch {
        let error = error as NSError
        viewContext.rollback()
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }
  }
}

// MARK: - Setup

private extension CoreDataService {
  func setupStorePath() {
    guard let container = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: CoreDataService.groupId)
    else {
      fatalError("No container found.")
    }
    let sharedPath = container.appendingPathComponent(CoreDataService.sharedPathName)
    let memoryPath = URL(fileURLWithPath: CoreDataService.memoryPathName)
    storeDescription.url = storeType == .memory ? memoryPath : sharedPath
  }

  func enableHistoryTracking() {
    storeDescription.setOption(true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
    storeDescription.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)
  }

  func loadPersistentStores() {
    persistentContainer.persistentStoreDescriptions = [storeDescription]

    persistentContainer.loadPersistentStores { _, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }
  }

  func setupQueryGeneration() {
    if storeType != .memory {
      try? viewContext.setQueryGenerationFrom(.current)
    }
  }
}

// MARK: - HistoryTracker

public final class HistoryTracker {
  private var subs = Set<AnyCancellable>()

  public typealias StorageActor = CoreDataService.StorageActor

  private let persistentContainer: NSPersistentContainer
  private let storageActor: StorageActor

  private lazy var historyRequestQueue = DispatchQueue(label: "history")

  public init(persistentContainer: NSPersistentContainer, storageActor: StorageActor) {
    print("HistoryTracker init")
    self.persistentContainer = persistentContainer
    self.storageActor = storageActor
    setupPublishers()
  }
}

private extension HistoryTracker {
  func setupPublishers() {
    NotificationCenter.default
      .publisher(for: .NSPersistentStoreRemoteChange)
      .sink { [self] in
        processChanges($0)
      }
      .store(in: &subs)
  }

  func processChanges(_ notification: Notification) {
    historyRequestQueue.async { [self] in

      let bgContext = persistentContainer.newBackgroundContext()
      bgContext.performAndWait { [self] in
        let lastUpdated = lastUpdated() ?? .distantPast
        let request = NSPersistentHistoryChangeRequest.fetchHistory(after: lastUpdated)

        // Only receive transactions that are NOT of the main app target
        if let historyFetchRequest = NSPersistentHistoryTransaction.fetchRequest {
          print("processChanges historyFetchRequest")
          historyFetchRequest.predicate = NSPredicate(
            format: "%K != %@",
            #keyPath(NSPersistentHistoryTransaction.author),
            CoreDataService.StorageActor.app.rawValue
          )
          request.fetchRequest = historyFetchRequest
        }

        do {
          // Fetch transactions
          guard let result = try bgContext.execute(request) as? NSPersistentHistoryResult,
                let transactions = result.result as? [NSPersistentHistoryTransaction],
                !transactions.isEmpty
          else {
            print("processChanges NO transactions")
            return
          }

          print("transactions", transactions.count)

          // Merge changes
          mergeChanges(transactions: transactions)

          // Clean up
          if let leastRecentUpdate = leastRecentUpdate() {
            let deleteRequest = NSPersistentHistoryChangeRequest.deleteHistory(before: leastRecentUpdate)
            try bgContext.execute(deleteRequest)
          }
        } catch {
          print(error)
        }
      } // bgContext
    } // historyRequestQueue
  }

  func mergeChanges(transactions: [NSPersistentHistoryTransaction]) {
    let context = persistentContainer.viewContext
    context.performAndWait { [self] in
      transactions.forEach { transaction in
        guard let userInfo = transaction.objectIDNotification().userInfo else { return }
        NSManagedObjectContext.mergeChanges(fromRemoteContextSave: userInfo, into: [context])

        persistLastUpdated(transaction.timestamp)
      }
    }
  }

  func lastUpdated() -> Date? {
    UserDefaults.shared.object(forKey: "HistoryTracker.lastUpdate.\(storageActor.rawValue)") as? Date
  }

  func persistLastUpdated(_ date: Date) {
    UserDefaults.shared.set(date, forKey: "HistoryTracker.lastUpdate.\(storageActor.rawValue)")
  }

  func leastRecentUpdate() -> Date? {
    StorageActor.allCases.reduce(nil) { date, storageActor in
      guard let storedDate = UserDefaults.shared.object(forKey: "HistoryTracker.lastUpdate.\(storageActor.rawValue)") as? Date
      else {
        return date
      }

      if let date = date {
        return min(date, storedDate)
      }

      return storedDate
    }
  }
}

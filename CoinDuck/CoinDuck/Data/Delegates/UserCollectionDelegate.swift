import Combine
import CoreData

protocol IUserCollectionDelegate {
  // Config
  var className: String { get }
  var entityType: UserCollection.EntityType { get }
  var bag: Set<AnyCancellable> { get }
  var resultsController: NSFetchedResultsController<UserCollection> { get set }

  // Dependencies
  var coreDataService: CoreDataService { get }

  // Publishers
  var itemsSubject: PassthroughSubject<[UserCollection], Never> { get }

  // CRUD Actions
  func createSystemCollection(completion: () -> Void)
  func fetchCollections()
  func createCollection(title: String, collectionType: UserCollection.CollectionType) -> UserCollection
  func editCollection(collection: UserCollection, title: String)
  func deleteCollection(collection: UserCollection)
  func count() -> Int

  // Relationship Actions
  func addToCollection(coin: Coin, collection: UserCollection)
  func removeFromCollection(userCoin: UserCoin, collection: UserCollection)
  func saveInStore(with items: [Coin])

  // Setup
  func createResultsController(
    context: NSManagedObjectContext,
    delegate: NSFetchedResultsControllerDelegate?
  ) -> NSFetchedResultsController<UserCollection>
}

// MARK: - Config

extension IUserCollectionDelegate {
  var bag: Set<AnyCancellable> {
    Set<AnyCancellable>()
  }
}

// MARK: - CRUD Actions

extension IUserCollectionDelegate {
  func createSystemCollection(completion: () -> Void) {
    print("\(className) createSystemCollection")
    let count = count()

    if count == 0 {
      print("Creating initial collection.")
      coreDataService.viewContext.performAndWait {
        let _ = UserCollection(
          context: coreDataService.viewContext,
          title: "Inbox",
          entityType: entityType,
          collectionType: .system
        )

        coreDataService.saveContext()
      }
    } else {
      print("ALREADY created initial collection.")
    }
  }

  func fetchCollections() {
    print("\(className) fetchCollections")
    try? resultsController.performFetch()
    let collections = resultsController.fetchedObjects ?? []
    itemsSubject.send(collections)
  }

  func createCollection(title: String, collectionType: UserCollection.CollectionType = .user) -> UserCollection {
    print("\(className) createCollection")
    let collection = UserCollection(
      context: coreDataService.viewContext,
      title: title,
      entityType: entityType,
      collectionType: collectionType
    )

    coreDataService.saveContext()
    return collection
  }

  func editCollection(collection: UserCollection, title: String) {
    print("\(className) editCollection")
    collection.raw_title = title

    coreDataService.saveContext()
  }

  func deleteCollection(collection: UserCollection) {
    print("\(className) deleteCollection")
    coreDataService.viewContext.delete(collection)

    coreDataService.saveContext()
  }

  func count() -> Int {
    print("\(className) count")
    let request = UserCollection.fetchRequest()
    request.predicate = NSPredicate(format: "%K == %@", #keyPath(UserCollection.raw_entityTypeValue), entityType.rawValue)
    guard let count = try? coreDataService.viewContext.count(for: request) else { return 0 }
    return count
  }
}

// MARK: - Relationship Actions

extension IUserCollectionDelegate {
  func addToCollection(coin: Coin, collection: UserCollection) {
    print(className, "addToCollection")
    let userCoin = UserCoin(
      context: coreDataService.viewContext,
      coinId: coin.id,
      collectionId: collection.collectionId
    )
    collection.addToRaw_userCoins(userCoin)

    coreDataService.saveContext()
  }

  func removeFromCollection(userCoin: UserCoin, collection: UserCollection) {
    print(className, "removeFromCollection")
    collection.removeFromRaw_userCoins(userCoin)

    coreDataService.saveContext()
  }

  func saveInStore(with items: [Coin]) {
    guard !items.isEmpty else {
      return
    }

    for item in items {
      if let coinId = item.raw_coinId {
        let userCoin = UserCoin.findOrInsert(by: coinId, context: coreDataService.viewContext)

        userCoin.raw_coinId = item.raw_coinId

        userCoin.raw_dateCreated = Date()

        userCoin.raw_name = item.raw_name
        userCoin.raw_symbol = item.raw_symbol
        userCoin.raw_rank = item.raw_rank

        if let iconUrl = item.raw_iconUrl {
          userCoin.raw_iconUrl = iconUrl
        }
        if let color = item.raw_color {
          userCoin.raw_color = color
        }

        userCoin.raw_price = item.raw_price
        userCoin.raw_change = item.raw_change
        userCoin.raw_sparkline = item.raw_sparkline
      }
    }

    try? coreDataService.viewContext.save()
  }
}

// MARK: - Setup

extension IUserCollectionDelegate {
  func createResultsController(
    context: NSManagedObjectContext,
    delegate: NSFetchedResultsControllerDelegate?
  ) -> NSFetchedResultsController<UserCollection> {
    let request = UserCollection.fetchRequest()

    request.predicate = NSPredicate(format: "%K == %@", #keyPath(UserCollection.raw_entityTypeValue), entityType.rawValue)

    request.sortDescriptors = [
      UserCollection.sortDescriptor(sort: .dateCreated, ascending: true),
    ]

    let resultsController = NSFetchedResultsController(
      fetchRequest: request,
      managedObjectContext: context,
      sectionNameKeyPath: nil,
      cacheName: nil
    )

    resultsController.delegate = delegate
    return resultsController
  }
}

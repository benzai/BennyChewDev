import Combine
import CoreData
import Foundation

///
/// CollectionProvider
///
final class CollectionProvider: NSObject, ObservableObject {
  // Controllers
  private var bag = Set<AnyCancellable>()

  private lazy var resultsController: NSFetchedResultsController<UserCoin> = {
    createResultsController(
      context: CoreDataService.shared.viewContext,
      delegate: self
    )
  }()

  // State
  @Published var collection: UserCollection
  @Published var items: [UserCoinViewModel] = []

  // Init
  private let storage: FavoritesStorage
  private let coinsAPIService: CoinsAPIService

  init(
    collection: UserCollection,
    storage: FavoritesStorage,
    coinsAPIService: CoinsAPIService
  ) {
    print("CollectionProvider init")
    self._collection = Published(wrappedValue: collection)
    self.storage = storage
    self.coinsAPIService = coinsAPIService
    super.init()
    setupPublishers()

    fetchUserCoins()
  }
}

// MARK: - Actions

extension CollectionProvider {
  func fetchUserCoins() {
    try? resultsController.performFetch()
    let items = resultsController.fetchedObjects ?? []
    self.items = items.map(UserCoinViewModel.init)
  }

  func updateCoinPrices() async {
    do {
      let coins = try await coinsAPIService.getCoinsById(coinIds: collection.coinIds)
      let dict: [String: Coin] = coins.reduce(into: [:]) { dict, coin in
        dict[coin.id] = coin
      }

      let updatedItems = items.map { (item: UserCoinViewModel) -> UserCoin in
        let model = item.model as UserCoin
        let itemData = dict[item.coinId]

        model.raw_name = itemData?.raw_name
        model.raw_symbol = itemData?.raw_symbol
        model.raw_rank = itemData?.raw_rank
        model.raw_price = itemData?.raw_price
        model.raw_change = itemData?.raw_change
        model.raw_sparkline = itemData?.raw_sparkline
        model.raw_iconUrl = itemData?.raw_iconUrl
        model.raw_color = itemData?.raw_color
        model.raw_detail = itemData?.raw_detail
        
        return model
      }

      DispatchQueue.main.async {
        self.items = updatedItems.map(UserCoinViewModel.init)
      }
    } catch {
      print(error)
    }
  }
}

// MARK: - NSFetchedResultsControllerDelegate

extension CollectionProvider: NSFetchedResultsControllerDelegate {
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    print("CollectionProvider controllerDidChangeContent")
    let items = controller.fetchedObjects as? [UserCoin] ?? []
    self.items = items.map(UserCoinViewModel.init)
  }
}

// MARK: - Setup

private extension CollectionProvider {
  func createResultsController(
    context: NSManagedObjectContext,
    delegate: NSFetchedResultsControllerDelegate?
  ) -> NSFetchedResultsController<UserCoin> {
    let request = UserCoin.fetchRequest()

    request.predicate = NSPredicate(format: "%K == %@", #keyPath(UserCoin.raw_collectionId), collection.collectionId as CVarArg)

    request.sortDescriptors = [
      UserCoin.sortDescriptor(sort: .dateCreated, ascending: true),
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

  func setupPublishers() {}
}

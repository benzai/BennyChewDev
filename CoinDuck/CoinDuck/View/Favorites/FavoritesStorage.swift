import Combine
import CoreData

///
/// FavoritesStorage
///
final class FavoritesStorage: NSObject, IUserCollectionDelegate {
  // Controllers
  internal var className: String { "FavoritesCollectionStorage" }
  internal var entityType: UserCollection.EntityType { .favorites }

  internal lazy var resultsController: NSFetchedResultsController<UserCollection> = {
    createResultsController(
      context: coreDataService.viewContext,
      delegate: self
    )
  }()

  // Publishers
  var itemsSubject = PassthroughSubject<[UserCollection], Never>()

  // Init
  internal let coreDataService: CoreDataService

  init(coreDataService: CoreDataService) {
    print("FavoritesCollectionStorage init")
    self.coreDataService = coreDataService
    super.init()
  }
}

// MARK: - Actions

extension FavoritesStorage {}

// MARK: - NSFetchedResultsControllerDelegate

extension FavoritesStorage: NSFetchedResultsControllerDelegate {
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    print("FavoritesCollectionStorage controllerDidChangeContent")
    let collections = controller.fetchedObjects as? [UserCollection] ?? []
    itemsSubject.send(collections)
  }
}

// MARK: - Setup

private extension FavoritesStorage {}

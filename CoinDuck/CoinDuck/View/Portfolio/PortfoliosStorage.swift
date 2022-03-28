import Combine
import CoreData

///
/// PortfoliosStorage
///
final class PortfoliosStorage: NSObject, IUserCollectionDelegate {
  // Controllers
  internal var className: String { "PortfolioCollectionStorage" }
  internal var entityType: UserCollection.EntityType { .portfolio }

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
    print("PortfolioCollectionStorage init")
    self.coreDataService = coreDataService
    super.init()
  }
}

// MARK: - Actions

extension PortfoliosStorage {}

// MARK: - NSFetchedResultsControllerDelegate

extension PortfoliosStorage: NSFetchedResultsControllerDelegate {
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    print("PortfolioCollectionStorage controllerDidChangeContent")
    let collections = controller.fetchedObjects as? [UserCollection] ?? []
    itemsSubject.send(collections)
  }
}

// MARK: - Setup

private extension PortfoliosStorage {}

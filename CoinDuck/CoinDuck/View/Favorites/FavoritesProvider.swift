import Combine
import CoreData
import Foundation

///
/// FavoritesProvider
///
final class FavoritesProvider: ObservableObject, UserCollectionProviderDelegate {
  // Controllers
  private var bag = Set<AnyCancellable>()

  // State
  @Published var collections: [UserCollection] = []

  // Page state
  @Published var currentPage: Int = 0
  @Published var currentTitle: String = ""
  var hasCollections: Bool {
    collections.isEmpty ? false : true
  }

  // Init
  internal let storage: FavoritesStorage
  internal let coinsAPIService: CoinsAPIService

  init(
    storage: FavoritesStorage,
    coinsAPIService: CoinsAPIService
  ) {
    print("FavoriteProvider init")
    self.storage = storage
    self.coinsAPIService = coinsAPIService
    setupPublishers()
  }
}

// MARK: - Actions

extension FavoritesProvider {}

// MARK: - Setup

private extension FavoritesProvider {
  func setupPublishers() {
    print("FavoriteProvider setupPublishers")

    // currentPage + collections
    Publishers.CombineLatest($currentPage, $collections)
      .receive(on: DispatchQueue.main)
      .sink { [self] page, cols in
        if hasCollections {
          currentTitle = cols[page].collectionTitle
        }
      }
      .store(in: &bag)

    // storage itemsSubject
    storage.itemsSubject
      .receive(on: DispatchQueue.main)
      .sink { [self] in
        collections = $0
      }
      .store(in: &bag)
  }
}

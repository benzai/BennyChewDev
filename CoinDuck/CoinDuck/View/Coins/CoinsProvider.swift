import Combine
import CoreData.NSManagedObjectContext
import Foundation

///
/// CoinProvider
///
final class CoinsProvider: ObservableObject {
  // Controllers
  private var bag = Set<AnyCancellable>()

  // State
  @Published var coins: [CoinViewModel] = []

  // Page State
  @Published private(set) var page: Int = 1

  /// TODO: Dynamic check (total coins count).
  private var canLoadNextPage: Bool {
    true
  }

  // Config
  /// TODO: From Settings.
  private let itemsPerPage: Int = 2

  // Init
  private let coinsAPIService: CoinsAPIService

  init(
    coinsAPIService: CoinsAPIService
  ) {
    print("CoinProvider init")
    self.coinsAPIService = coinsAPIService
    setupPublishers()
  }
}

// MARK: - Actions

extension CoinsProvider {
  func getCoins() async {
    print("CoinProvider getCoins")
    do {
      let coins = try await coinsAPIService.getCoins(by: page, itemsPerPage: itemsPerPage, timePeriod: .day)
      DispatchQueue.main.async {
        self.coins += coins.map(CoinViewModel.init)
      }
    } catch {
      print(error)
    }
  }

  func goToNextPage() {
    print("CoinProvider goToNextPage")
    if canLoadNextPage {
      page += 1
    }
  }

  func refreshAllCoins() async {
    print("CoinProvider refreshAllCoins")
    let pages = page
    do {
      let allCoins = try await coinsAPIService.getCoinsInBatches(pages: pages, itemsPerPage: itemsPerPage, timePeriod: .day)
      self.coins = allCoins.map(CoinViewModel.init)
    } catch {
      print(error)
    }
  }
}

// MARK: - Helpers

private extension CoinsProvider {
  func setupPublishers() {
    // Page
    $page
      .receive(on: DispatchQueue.main)
      .sink { [self] _ in
        Task {
          await getCoins()
        }
      }
      .store(in: &bag)
  }
}

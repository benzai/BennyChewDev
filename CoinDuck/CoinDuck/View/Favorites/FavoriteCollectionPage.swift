import SwiftUI

///
/// FavoritesCollectionPage
///
struct FavoritesCollectionPage: View {
  @EnvironmentObject private var settings: AppSettings
  @EnvironmentObject private var theme: AppTheme
  @EnvironmentObject private var router: AppRouter

  // State
  @State private var refreshId: UUID = UUID()

  // Init
  @StateObject private var provider: CollectionProvider

  init(
    collection: UserCollection,
    storage: FavoritesStorage,
    coinsAPIService: CoinsAPIService
  ) {
    self._provider = StateObject(wrappedValue: CollectionProvider(
      collection: collection,
      storage: storage,
      coinsAPIService: coinsAPIService
    ))
  }

  var body: some View {
    ScrollView {
      LazyVStack(spacing: 0) {
        ForEach(provider.items) {
          CoinCellView(model: $0, onItemTap: nil, onAccessoryTap: nil)
        }
      }
      .id(refreshId)
      .onAppear(perform: onAppear)
      .onDisappear(perform: onDisappear)
    }
  }
}

// MARK: - Actions

private extension FavoritesCollectionPage {
  func onAppear() {
    print("FavoritesCollectionPage onAppear")
    Task {
      await provider.updateCoinPrices()
      DispatchQueue.main.async {
        self.refreshId = UUID()
      }
    }
  }

  func onDisappear() {}
}

// MARK: - Item Actions

private extension FavoritesCollectionPage {
  func onItemTap(model: UserCoin) {}

  func onAccessoryTap(model: UserCoin) {}

  func onPageAppear() {}
}

// MARK: - Views

private extension FavoritesCollectionPage {}

// MARK: - Previews

import SwiftUI

///
/// CoinsPage
///
struct CoinsPage: View {
  @EnvironmentObject private var settings: AppSettings
  @EnvironmentObject private var theme: AppTheme
  @EnvironmentObject private var router: AppRouter

  // State

  // Init
  @ObservedObject private var provider: CoinsProvider

  init(provider: CoinsProvider) {
    self.provider = provider
  }

  var body: some View {
    NavigationView {
      ZStack(alignment: .bottomTrailing) {
        coinsList()
        floatingActionButton()
      }
      .navigationBarTitle("Coins", displayMode: .inline)
      .navigationBarItems(trailing: barButtonsTrailing())

      .sheet(isPresented: $router.isPresented) {
        router.modal()
      }
    }
    .navigationViewStyle(.stack)

    .onAppear(perform: onAppear)
    .onDisappear(perform: onDisappear)
  }
}

// MARK: - Actions

private extension CoinsPage {
  func onAppear() {
    print("CoinsPage onAppear")
  }

  func onDisappear() {
    print("CoinsPage onDisappear")
  }

  func onLastItemOfPage() {
    print("CoinsPage onLastItemOfPage")
//    coinsProvider.goToNextPage()
  }
}

// MARK: - Nav Actions

private extension CoinsPage {
  func onBarButtonRightTap() {
    print("CoinsPage onBarButtonRightTap")
    Task {
      await provider.refreshAllCoins()
    }
  }

  func onFloatingActionButtonTap() {
    print("CoinsPage onFloatingActionButtonTap")
    provider.goToNextPage()
  }
}

// MARK: - Item Actions

private extension CoinsPage {
  func onItemTap(viewModel: CoinViewModel) {
    print("CoinsPage onItemTap")
//    router.presentModal(.coinDetail(model))
  }

  func onAccessoryTap(viewModel: CoinViewModel) {
    print("CoinsPage onAccessoryTap")
//    favoritesProvider.addFavorite(coinId: model.coinId)
//    coinsProvider.updateCoinState(mode: .favorites, coinId: model.coinId, newValue: true)
  }
}

// MARK: - Contextual Menu Actions

private extension CoinsPage {
  func onContextItemTap_View(viewModel: CoinViewModel) {
    print("CoinsPage onContextItemTap_View")
  }

  func onContextItemTap_Favorite(viewModel: CoinViewModel) {
    print("CoinsPage onContextItemTap_Favorite")
    router.presentModal(.favoritesList(viewModel: viewModel))
  }

  func onContextItemTap_Portfolio(viewModel: CoinViewModel) {
    print("CoinsPage onContextItemTap_Portfolio")
  }
}

// MARK: - Views

private extension CoinsPage {
  func barButtonsTrailing() -> some View {
    Column(spacing: 4) {
      Image(R.image.icon_coin.name)
        .resizable()
        .onTapGesture {
          onBarButtonRightTap()
        }
    }
  }

  func coinsList() -> some View {
    ScrollView {
      LazyVStack(spacing: 0) {
        ForEach(provider.coins) { (viewModel: CoinViewModel) in
          NavigationLink(destination: AC.shared.coinDetailPage(model: viewModel)) {
            CoinCellView<CoinViewModel>(
              model: viewModel,
              onItemTap: onItemTap,
              onAccessoryTap: onAccessoryTap
            )
            .contextMenu(menuItems: {
              Button("View details") {
                onContextItemTap_View(viewModel: viewModel)
              }
              Button("Add to favorites") {
                onContextItemTap_Favorite(viewModel: viewModel)
              }
              Button("Add to portfolio") {
                onContextItemTap_Portfolio(viewModel: viewModel)
              }
            })
            .onAppear {
              if provider.coins.last == viewModel {
                onLastItemOfPage()
              }
            }
          }
        }
      }
    }
  }

  func floatingActionButton() -> some View {
    Button(action: onFloatingActionButtonTap) {
      ZStack {
        Circle()
          .fill(Color.black)
          .frame(width: 48, height: 48)

        Image(systemName: "plus")
          .renderingMode(.template)
          .foregroundColor(.white)
      }
    }
    .padding()
  }
}

// MARK: - Previews

// struct CoinsPage_Previews: PreviewProvider {
//  static var previews: some View {
//    let coinsProvider = AC.shared.coinsProvider
//    coinsProvider.coins = CoinsProvider.mockCoins().map(CoinViewModel.init)
//    return CoinsPage(
//      coinsProvider: coinsProvider
//    )
//    .environmentObject(AC.shared.settings)
//    .environmentObject(AC.shared.theme)
//    .environmentObject(AC.shared.router)
//  }
// }

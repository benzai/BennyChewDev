import SwiftUI

struct CollectionsListPage: View {
  // State

  // Init
  private let viewModel: CoinViewModel
  @ObservedObject private var favoritesProvider: FavoritesProvider

  init(viewModel: CoinViewModel, favoritesProvider: FavoritesProvider) {
    self.viewModel = viewModel
    self.favoritesProvider = favoritesProvider
  }

  var body: some View {
    NavigationView {
      VStack {
        list()
      }
      .navigationTitle("\(viewModel.name)")
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarItems(trailing: barButtonRight())

      .onAppear(perform: onAppear)
    }
    .navigationViewStyle(.stack)
  }
}

// MARK: - Actions

private extension CollectionsListPage {
  func onAppear() {
    print("CollectionsListPage onAppear")
  }

  func onBarButtonRightTap() {}
}

// MARK: - Item Actions

private extension CollectionsListPage {
  func onListItemTap(collection: UserCollection, userCoin: UserCoin?) {
    print("CollectionsListPage onListItemTap")
  }

  func onAccessoryTap(collection: UserCollection, userCoin: UserCoin?) {
    print("CollectionsListPage onAccessoryTap")
    if let userCoin = userCoin {
      favoritesProvider.removeFromCollection(userCoin: userCoin, collection: collection)
    } else {
      favoritesProvider.addToCollection(coin: viewModel.model, collection: collection.collection)
    }
  }
}

// MARK: - Views

private extension CollectionsListPage {
  func barButtonRight() -> some View {
    Button(action: onBarButtonRightTap) {
      Image(R.image.icon_plus.name)
        .renderingMode(.template)
    }
  }
}

// MARK: - Main Views

private extension CollectionsListPage {
  func list() -> some View {
    ScrollView {
      ForEach(favoritesProvider.collections) { collection in
        VStack(spacing: 0) {
          CollectionCellView(
            collection: collection,
            userCoin: collection.findUserCoin(coinId: viewModel.id),
            onItemTap: onListItemTap,
            onAccessoryTap: onAccessoryTap
          )
        }
      }
      .padding(.all, 20)
    }
  }
}

// MARK: - Previews

// struct CollectionsListPage_Previews: PreviewProvider {
//  static let viewModel = CoinViewModel(coin: Coin.mockCoin_bitcoin())
//  static let provider = AC.shared.favoritesProvider
//
//  static var previews: some View {
//    CollectionsListPage(
//      viewModel: viewModel,
//      favoritesProvider: AC.shared.favoritesProvider
//    )
//    .environmentObject(AC.shared.settings)
//    .environmentObject(AC.shared.theme)
//
//    .previewLayout(.sizeThatFits)
//  }
// }

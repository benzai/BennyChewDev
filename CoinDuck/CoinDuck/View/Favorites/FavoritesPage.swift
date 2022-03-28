import SwiftUI

///
/// FavoritesPage
///
struct FavoritesPage: View {
  @EnvironmentObject private var settings: AppSettings
  @EnvironmentObject private var theme: AppTheme
//  @EnvironmentObject private var router: AppRouter

  // State
  @State private var refreshId: UUID = UUID()

  // Init
  @ObservedObject private var provider: FavoritesProvider

  init(provider: FavoritesProvider) {
    self.provider = provider
  }

  var body: some View {
    NavigationView {
      ZStack(alignment: .bottomTrailing) {
        pageSlider()

        floatingActionButton()
      }
      .id(refreshId)
      .navigationBarTitle(provider.currentTitle, displayMode: .inline)
      .navigationBarItems(trailing: barButtonsTrailing())
    }
    .navigationViewStyle(.stack)

    .onAppear(perform: onAppear)
    .onDisappear(perform: onDisappear)

//    .sheet(isPresented: $router.isPresented) {
//      router.modal()
//    }
  }
}

// MARK: - Actions

private extension FavoritesPage {
  func onAppear() {
    self.refreshId = UUID()
  }

  func onDisappear() {}

  func onLastItemOfPage() {
    print("FavoritesPage onLastItemOfPage")
  }
}

// MARK: - Nav Actions

private extension FavoritesPage {
  func onBarButtonRightTap() {}

  func onFloatingActionButtonTap() {
    provider.createCollection(title: nil)
  }
}

// MARK: - Item Actions

private extension FavoritesPage {
  func onItemTap(model: Coin) {}

  func onAccessoryTap(model: Coin) {}
}

// MARK: - Views

private extension FavoritesPage {
  func barButtonsTrailing() -> some View {
    Column(spacing: 4) {
      Image(R.image.icon_coin.name)
        .resizable()
        .onTapGesture {
          onBarButtonRightTap()
        }
    }
  }

  @ViewBuilder
  func pageSlider() -> some View {
    if provider.hasCollections {
      TabView(selection: $provider.currentPage) {
        ForEach(provider.collections.indices, id: \.self) { idx in
          AC.shared.favoritesCollectionPage(collection: provider.collections[idx])
            .tag(idx)
        }
      }
      .tabViewStyle(.page(indexDisplayMode: .never))
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    } else {
      Row {
        Text("Nothing")
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
  }

  func floatingActionButton() -> some View {
    Button(action: onFloatingActionButtonTap) {
      ZStack {
        Circle()
          .fill(Color.black)
          .frame(width: 48, height: 48)

        Image(R.image.icon_plus.name)
          .resizable()
          .frame(width: 24, height: 24)
          .foregroundColor(theme.colors.altText1)
      }
    }
    .padding()
  }
}

// MARK: - Previews

// struct FavoritesPage_Previews: PreviewProvider {
//  static var previews: some View {
//    let favoritesProvider = AC.shared.favoritesProvider
//    favoritesProvider.collections = UserCollection.mockFavoriteCollections()
//      .map(UserCollectionViewModel.init)
//
//    return FavoritesPage(
//      favoritesProvider: favoritesProvider
//    )
//    .environmentObject(AC.shared.settings)
//    .environmentObject(AC.shared.theme)
//  }
// }

// struct FavPage: View {
//  @EnvironmentObject private var settings: AppSettings
//  @EnvironmentObject private var theme: AppTheme
////  @EnvironmentObject private var router: AppRouter
//
//  // State
//
//  // Init
//  @StateObject var favPagVM: FavPageVM
//  @Binding var collection: UserCollectionViewModel
//  @ObservedObject private var favoritesProvider: FavoritesProvider
//
//  init(favoritesProvider: FavoritesProvider, collection: Binding<UserCollectionViewModel>) {
//    self.favoritesProvider = favoritesProvider
//    _collection = collection
//    _favPagVM = StateObject(wrappedValue: FavPageVM(viewModels: collection.wrappedValue.userCoinViewModels))
//  }
//
//  var body: some View {
//    if favoritesProvider.hasCollections {
//      ScrollView {
//        LazyVStack(spacing: 0) {
//          ForEach($favPagVM.viewModels) {
//            CoinCellView(viewModel: $0.wrappedValue, onItemTap: nil, onAccessoryTap: nil)
//          }
//        }
//      }
//      .onAppear {
////        favPagVM.updateVM(vms: collection.userCoinViewModels)
//      }
//    }
//  }
// }
//
// class FavPageVM: ObservableObject {
//  @Published var viewModels: [UserCoinViewModel]
//
//  init(viewModels: [UserCoinViewModel]) {
//    _viewModels = Published(initialValue: viewModels)
//  }
//
//  func updateVM(vms: [UserCoinViewModel]) {
//    self.viewModels = vms
//  }
// }

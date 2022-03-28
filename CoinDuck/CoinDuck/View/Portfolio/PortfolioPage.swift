import SwiftUI

///
/// PortfoliosPage
///
struct PortfoliosPage: View {
  @EnvironmentObject private var settings: AppSettings
  @EnvironmentObject private var theme: AppTheme
  @EnvironmentObject private var router: AppRouter

  // State

  // Init
  @ObservedObject private var provider: PortfoliosProvider

  init(provider: PortfoliosProvider) {
    self.provider = provider
  }

  var body: some View {
    NavigationView {
      ZStack(alignment: .bottomTrailing) {
        pageSlider()
        floatingActionButton()
      }
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

private extension PortfoliosPage {
  func onAppear() {}

  func onDisappear() {}
}

// MARK: - Nav Actions

private extension PortfoliosPage {
  func onBarButtonRightTap() {}

  func onFloatingActionButtonTap() {}
}

// MARK: - Item Actions

private extension PortfoliosPage {
  func onItemTap(model: Coin) {}

  func onAccessoryTap(model: Coin) {}
}

// MARK: - Views

private extension PortfoliosPage {
  func barButtonsTrailing() -> some View {
    Column(spacing: 4) {
      Image(R.image.icon_coin.name)
        .icon(size: 32, color: .white)

      Image(R.image.icon_coin.name)
        .icon(size: 32, color: .red)
    }
  }

  @ViewBuilder
  func pageSlider() -> some View {
    if provider.hasCollections {
      TabView(selection: $provider.currentPage) {
        ForEach(provider.collections.indices, id: \.self) { idx in
//          list(collection: provider.collections[idx])
//            .tag(idx)
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

//  @ViewBuilder
//  func list(collection: UserCollection) -> some View {
//    if provider.hasCollections {
//      ScrollView {
//        LazyVStack(spacing: 0) {
//          ForEach(collection.userCoins) {
//            CoinCellView(model: $0, onItemTap: nil, onAccessoryTap: nil)
//          }
//        }
//      }
//    }
//  }

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

import SwiftUI

final class AppContainer: ObservableObject {
  static let shared = AppContainer()

  // Environment
  private(set) var settings: AppSettings
  private(set) var theme: AppTheme
  private(set) var router: AppRouter

  // Services
  private(set) var coreDataService: CoreDataService
  private(set) var coinsAPIService: CoinsAPIService
  private(set) var favoritesCollectionStorage: FavoritesStorage
  private(set) var portfolioCollectionStorage: PortfoliosStorage

  // Providers
  private(set) var coinsProvider: CoinsProvider
  private(set) var favoritesProvider: FavoritesProvider
  private(set) var portfolioProvider: PortfoliosProvider

  // Init
  private init() {
    print("AppContainer init")

    // Environment
    settings = AppSettings.shared
    theme = AppTheme.shared
    router = AppRouter()

    // Services
    coreDataService = CoreDataService.shared
    coinsAPIService = CoinsAPIService()
    favoritesCollectionStorage = FavoritesStorage(coreDataService: coreDataService)
    portfolioCollectionStorage = PortfoliosStorage(coreDataService: coreDataService)

    // Providers
    coinsProvider = CoinsProvider(
      coinsAPIService: coinsAPIService
    )

    favoritesProvider = FavoritesProvider(
      storage: favoritesCollectionStorage,
      coinsAPIService: coinsAPIService
    )

    portfolioProvider = PortfoliosProvider(
      storage: portfolioCollectionStorage,
      coinsAPIService: coinsAPIService
    )

    // Initial setup
    initialSetup()
  }
}

// MARK: - Setup

private extension AppContainer {
  func initialSetup() {
    print("AppContainer initialSetup")
    Task {
      await favoritesProvider.createSystemCollection()
      await portfolioProvider.createSystemCollection()
      favoritesProvider.fetchCollections()
      portfolioProvider.fetchCollections()
    }
  }
}

// MARK: - Pages (SwiftUI)

extension AppContainer {
  func rootVC() -> UIViewController {
    UIHostingController(rootView: tabBarPage())
  }

  func tabBarPage() -> some View {
    TabBarPage()
      .environmentObject(settings)
      .environmentObject(theme)
      .environmentObject(router)
  }

  func coinsPage() -> some View {
    CoinsPage(provider: coinsProvider)
  }

  func coinDetailPage(model: CoinViewModel) -> some View {
    CoinDetailPage(model: model, coinsProvider: coinsProvider, favoritesProvider: favoritesProvider, portfolioProvider: portfolioProvider)
  }

  func favoritesPage() -> some View {
    FavoritesPage(provider: favoritesProvider)
  }

  func favoritesCollectionPage(collection: UserCollection) -> some View {
    FavoritesCollectionPage(collection: collection, storage: favoritesCollectionStorage, coinsAPIService: coinsAPIService)
  }

  func portfoliosPage() -> some View {
    PortfoliosPage(provider: portfolioProvider)
  }

  func settingsPage() -> some View {
    SettingsPage()
  }
}

// MARK: - Modals (SwiftUI)

extension AppContainer {
  func collectionsListPage(viewModel: CoinViewModel) -> some View {
    CollectionsListPage(viewModel: viewModel, favoritesProvider: favoritesProvider)
  }

  func settingsPickerPage_theme(
    setting: Setting = .theme,
    activeItem: Binding<UserTheme>,
    handler: @escaping (Setting, ISettingChoice) -> Void
  ) -> some View {
    SettingsPickerPage<UserTheme>(
      setting: setting,
      activeItem: activeItem,
      items: UserTheme.allCases,
      onItemTap: handler
    )
    .eraseToAnyView()
  }

  func settingsPickerPage_currency(
    setting: Setting = .currency,
    activeItem: Binding<Coin.Currency>,
    handler: @escaping (Setting, ISettingChoice) -> Void
  ) -> some View {
    SettingsPickerPage<Coin.Currency>(
      setting: setting,
      activeItem: activeItem,
      items: Coin.Currency.allCases,
      onItemTap: handler
    )
    .eraseToAnyView()
  }
}

// MARK: - Pages (UIKit)

// extension AppContainer {
//  func tabBarVC() -> TabBarVC {
//    TabBarVC()
//  }
//
//  func coinsVC() -> CoinsVC {
//    CoinsVC()
//  }
//
//  func favoritesVC() -> FavoritesVC {
//    FavoritesVC()
//  }
//
////  func portfoliosVC() -> PortfoliosVC {
////    PortfoliosVC()
////  }
//
////  func favoriteCollectionList(model: Coin) -> UINavigationController {
////    let page = CollectionsListPage(model: model, favoriteProvider: favoriteProvider)
////    let vc = UIHostingController(rootView: page)
////    let nav = UINavigationController(rootViewController: vc)
////    nav.navigationBar.isHidden = true
//  ////    if let sheet = nav.sheetPresentationController {
//  ////      sheet.detents = [.medium(), .large()]
//  ////    }
////    return nav
////  }
// }

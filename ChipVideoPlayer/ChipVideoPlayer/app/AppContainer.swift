import UIKit

///
/// AppContainer
///
final class AppContainer: ObservableObject {
  static let shared = AppContainer()

  // Environment
  private(set) var theme: AppTheme

  // Services
  private var videoAPIService: VideoAPIService

  // View Models
  private var videosViewModel: VideosViewModel

  // Init
  private init() {
    print("AppContainer")

    theme = AppTheme.shared

    videoAPIService = VideoAPIService()

    videosViewModel = VideosViewModel(service: videoAPIService)
  }
}

// MARK: - Pages

extension AppContainer {
  func tabBarPage() -> TabBarPage {
    TabBarPage()
  }
}

// MARK: - Video Pages

extension AppContainer {
  func videosPage() -> VideosPage {
    VideosPage(viewModel: videosViewModel)
  }

  func detailPage(itemId: Int) -> DetailPage {
    DetailPage(itemId: itemId, viewModel: videosViewModel)
  }
}

// MARK: - Search Pages

extension AppContainer {
  func searchPage() -> SearchPage {
    SearchPage(viewModel: videosViewModel)
  }
}

// MARK: - Account Pages

extension AppContainer {
  func settingsPage() -> SettingsPage {
    SettingsPage()
  }
}

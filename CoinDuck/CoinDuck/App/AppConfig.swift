import Combine
import CoreData
import Foundation
import SwiftUI
import UIKit

// MARK: - Shortcuts

typealias AC = AppContainer

// MARK: - Shared UserDefaults

extension UserDefaults {
  static var shared = UserDefaults(suiteName: "group.nl.chipchip.LearnNewCoreData2022")!
}

// MARK: - Enums

/// NetworkError
enum NetworkError: Error {
  case bad
}

/// LoadingState
enum LoadingState<T> {
  case idle
  case loading
  case doneNothing
  case done(T)
  case failure(Error)
}

// protocol EntityFilter {
//  var predicate: NSPredicate? { get }
// }
//
// protocol EntitySort {
//  var sortDescriptor: NSSortDescriptor { get }
// }

/// SystemTheme
/// - Used in TabBarController traitCollectionDidChange
/// - The Int correspond to previousTraitCollection.userInterfaceStyle.rawValue
enum SystemTheme: Int, CaseIterable {
  case light = 1
  case dark = 2
}

// MARK: - Config

/// Tab
enum Tab: Int, CaseIterable, Identifiable {
  var id: Self { self }

  case coins
  case favorites
  case portfolios
  case settings

  var tabStyle: TabStyle {
    switch self {
    case .coins:
      return TabStyle(
        page: AC.shared.coinsPage().eraseToAnyView(),
        icon: R.image.icon_coin.name,
        title: "Coins"
      )
    case .favorites:
      return TabStyle(
        page: AC.shared.favoritesPage().eraseToAnyView(),
        icon: R.image.icon_favorite.name,
        title: "Favorites"
      )
    case .portfolios:
      return TabStyle(
        page: AC.shared.portfoliosPage().eraseToAnyView(),
        icon: R.image.icon_portfolio.name,
        title: "Portfolios"
      )
    case .settings:
      return TabStyle(
        page: AC.shared.settingsPage().eraseToAnyView(),
        icon: R.image.icon_settings.name,
        title: "Settings"
      )
    }
  }
}

extension Tab {
  struct TabStyle {
    let page: AnyView
    let icon: String
    let title: String
  }
}

/// Setting
enum Setting: String, CaseIterable {
  case language
  case theme
  case currency
  case aboutApp
}

/// Language
/// - Languages are handled by Localizations

/// UserTheme
enum UserTheme: String, CaseIterable, ISettingChoice {
  case system
  case light
  case dark

  var key: String {
    rawValue
  }

  var title: String {
    switch self {
    case .system: return "System"
    case .light: return "Light"
    case .dark: return "Dark"
    }
  }
}

// MARK: - Strings

struct Strings {
  static let cryptoIconsBaseUrl = "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128"
  static let cryptoIconsBackupUrl = "https://raw.githubusercontent.com/spothq/cryptocurrency-icons/master/128"
  static let blankIconUrl = "https://benzai.github.io/shits-test-assets/avatars/puang.png"
  static let defaultCoinUrl = "https://chipchip.design"
}

enum CryptoIconTheme: String, CaseIterable {
  case color
  case white
  case black
}

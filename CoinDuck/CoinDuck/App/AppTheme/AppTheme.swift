import Combine
import Rswift
import SwiftUI
import UIKit

///
/// AppTheme
///
final class AppTheme: ObservableObject {
  private var subs = Set<AnyCancellable>()

  static let shared = AppTheme()

  // State
  @Published var colors: ColorTheme

  private init() {
    print("AppTheme init")

    switch AppSettings.shared.userTheme {
    case .system:
      self._colors = UIApplication.isLight ?
        Published(wrappedValue: LightTheme()) :
        Published(wrappedValue: DarkTheme())
    case .light:
      self._colors = Published(wrappedValue: LightTheme())
    case .dark:
      self._colors = Published(wrappedValue: DarkTheme())
    }

    AppSettings.shared.$userTheme.sink { [self] userTheme in
      onUserThemeChange(to: userTheme)
    }
    .store(in: &subs)
  }
}

// MARK: - Actions

extension AppTheme {
  func onSystemThemeChange(previousTheme: SystemTheme) {
    if AppSettings.shared.userTheme == .system {
      colors = previousTheme == .light ? DarkTheme() : LightTheme()
    }
  }

  func onUserThemeChange(to userTheme: UserTheme) {
    switch userTheme {
    case .system:
      print("onUserThemeChange system")
      colors = UIApplication.isLight ? LightTheme() : DarkTheme()
    case .light:
      print("onUserThemeChange light")
      colors = LightTheme()
    case .dark:
      print("onUserThemeChange dark")
      colors = DarkTheme()
    }
  }

  func setupSystemUI() {
    customizeNavBar()
    customizeTabBar()
    rebuildWindow()
  }
}

// MARK: - Setup

private extension AppTheme {
  func customizeNavBar() {
    let navBarAppearance = UINavigationBarAppearance()

    // Background color
    navBarAppearance.backgroundColor = colors.accent1.uiColor()

    // NavBar title
    navBarAppearance.titleTextAttributes = [
      .font: UIFont(name: AppTheme.FontFamily.bold.name, size: AppTheme.FontSize.md2.value.size)!,
      .kern: AppTheme.FontSize.md2.value.kerning,
      .foregroundColor: colors.navBarText.uiColor(),
    ]

    // NavBar large title
    navBarAppearance.largeTitleTextAttributes = [
      .font: UIFont(name: AppTheme.FontFamily.bold.name, size: AppTheme.FontSize.lg2.value.size)!,
      .kern: AppTheme.FontSize.lg2.value.kerning,
      .foregroundColor: colors.navBarText.uiColor(),
    ]

    // Tint and bar tint color
    UINavigationBar.appearance().tintColor = colors.navBarTint.uiColor()
    UINavigationBar.appearance().barTintColor = .green

    // Apply
    UINavigationBar.appearance().standardAppearance = navBarAppearance
    UINavigationBar.appearance().compactAppearance = navBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
  }

  func customizeTabBar() {
    let tabBarAppearance = UITabBarAppearance()

    // Background color
    tabBarAppearance.configureWithOpaqueBackground()
    tabBarAppearance.backgroundColor = .blue

    // Tint
    tabBarAppearance.selectionIndicatorTintColor = .red

    // Tab item
    let itemAppearance = UITabBarItemAppearance()

    itemAppearance.normal.iconColor = .white
    itemAppearance.selected.iconColor = .black
    itemAppearance.normal.titleTextAttributes = [
      .font: UIFont.systemFont(ofSize: AppTheme.FontSize.xs.value.size, weight: .regular),
      .foregroundColor: AppTheme.shared.colors.navBarText.uiColor(),
    ]
    itemAppearance.selected.titleTextAttributes = [
      .font: UIFont.systemFont(ofSize: AppTheme.FontSize.xs.value.size, weight: .regular),
      .foregroundColor: UIColor.green,
    ]

    // Apply
    tabBarAppearance.stackedLayoutAppearance = itemAppearance
    tabBarAppearance.inlineLayoutAppearance = itemAppearance
    tabBarAppearance.compactInlineLayoutAppearance = itemAppearance

    UITabBar.appearance().standardAppearance = tabBarAppearance

    // iOS 15 fix
    if #available(iOS 15.0, *) {
      UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
  }

  func rebuildWindow() {
    let windows = UIApplication.shared.windows
    for window in windows {
      for view in window.subviews {
        view.removeFromSuperview()
        window.addSubview(view)
      }
    }
  }
}

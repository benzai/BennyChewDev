///
/// ChipVideoPlayer
///
/// Copyright ChipChip.
/// By Benny Chew.
///

import UIKit

///
/// SceneDelegate
///
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(
    _ scene: UIScene, willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = (scene as? UIWindowScene) else { fatalError("Window scene is broken!") }
    setupRootPage(windowScene: windowScene)
  }
}

private extension SceneDelegate {
  func setupRootPage(windowScene: UIWindowScene) {
    let window = UIWindow(windowScene: windowScene)

    let page = AC.shared.tabBarPage()
    window.rootViewController = page

    self.window = window
    window.makeKeyAndVisible()
  }
}

///
/// AppDelegate
///
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    customizeNavBar()
    customizeTabBar()
    return true
  }

  func application(
    _ application: UIApplication,
    configurationForConnecting connectingSceneSession: UISceneSession,
    options: UIScene.ConnectionOptions
  ) -> UISceneConfiguration {
    return UISceneConfiguration(
      name: "Default Configuration",
      sessionRole: connectingSceneSession.role
    )
  }
}

private extension AppDelegate {
  func customizeNavBar() {
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithDefaultBackground()
    coloredAppearance.backgroundColor = AT.ColorTint.altBg1.uiColor

    coloredAppearance.titleTextAttributes = [
      .font: UIFont(name: AT.FontFamily.bold.name, size: AT.FontSize.md2.value.size)!,
      .kern: AT.FontSize.md2.value.kerning, .foregroundColor: AT.ColorTint.altText1.uiColor,
    ]

    coloredAppearance.largeTitleTextAttributes = [
      .font: UIFont(name: AT.FontFamily.bold.name, size: AT.FontSize.lg2.value.size)!,
      .kern: AT.FontSize.lg2.value.kerning, .foregroundColor: AT.ColorTint.altText1.uiColor,
    ]

    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
  }

  func customizeTabBar() {
    let tabBarStyle = UITabBar.appearance()

    // Bar color
    tabBarStyle.barTintColor = AT.ColorTint.bg1.uiColor

    // Icon color
    tabBarStyle.unselectedItemTintColor = AT.ColorTint.text3.uiColor

    // Icon color active
    tabBarStyle.tintColor = AT.ColorTint.accent1.uiColor

    // Text
    let tabBarItemStyle = UITabBarItem.appearance()
    tabBarItemStyle.setTitleTextAttributes([
      .font: UIFont(
        name: AT.FontFamily.regular.name,
        size: AT.FontSize.sm3.value.size
      )!,
      .foregroundColor: AT.ColorTint.accent1.uiColor,
    ],
    for: .normal)
  }
}

import UIKit

extension UIApplication {
  static var appName: String {
    Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? "App Name"
  }

  static var appVersion: String {
    Bundle.main
      .object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "Version 0.0"
  }

  static func openSettings() {
    UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
  }

  static var isLight: Bool {
    UITraitCollection.current.userInterfaceStyle == .light ? true : false
  }

  static var isDark: Bool {
    UITraitCollection.current.userInterfaceStyle == .dark ? true : false
  }
}

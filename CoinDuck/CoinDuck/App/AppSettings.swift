import Combine
import Foundation
import UIKit

extension AppSettings {
  enum Keys {
    static let schemaVersion = "schemaVersion"
    static let userTheme = "userTheme"
    static let currency = "currency"
  }

  enum Defaults {
    /// schemaVersion last incremented to v1 on 2022-01-09
    static let schemaVersion: Int = 1
    static let userTheme: UserTheme = .system
    static let currency: Coin.Currency = .usd
  }
}

///
/// AppSettings
///
final class AppSettings: ObservableObject {
  static let shared = AppSettings()

  // State
  @Published var userTheme: UserTheme = {
    enumSetting(key: Keys.userTheme, defaultValue: Defaults.userTheme)
  }()

  @Published var currency: Coin.Currency = {
    enumSetting(key: Keys.currency, defaultValue: Defaults.currency)
  }()

  // Init
  private init() {
    print("AppSettings init")
    let storedSchemaVersion = UserDefaults.standard.integer(forKey: Keys.schemaVersion)
    if storedSchemaVersion < Defaults.schemaVersion {
      print("Setting defaults for schema version: \(Defaults.schemaVersion).")
      setSchemaVersion(to: Defaults.schemaVersion)
      changeUserTheme(to: Defaults.userTheme)
      changeCurrency(to: Defaults.currency)
    } else {
      print("Defaults already set.")
    }

    print("AppSettings schemaVersion: \(storedSchemaVersion)")
    print("AppSettings userTheme: \(userTheme)")
    print("AppSettings currency: \(currency)")
  }
}

// MARK: - Actions

extension AppSettings {
  func changeUserTheme(to value: UserTheme) {
    userTheme = value
    UserDefaults.standard.set(value.rawValue, forKey: Keys.userTheme)
  }

  func changeCurrency(to value: Coin.Currency) {
    currency = value
    UserDefaults.standard.set(value.rawValue, forKey: Keys.currency)
  }
}

// MARK: - Helpers

private extension AppSettings {
  func setSchemaVersion(to value: Int) {
    UserDefaults.standard.set(value, forKey: Keys.schemaVersion)
  }

  static func stringSetting(key: String, defaultValue: String) -> String {
    guard let setting = UserDefaults.standard.string(forKey: key)
    else {
      UserDefaults.standard.set(defaultValue, forKey: key)
      return defaultValue
    }
    return setting
  }

  static func intSetting(key: String, defaultValue: Int) -> Int {
    let setting = UserDefaults.standard.integer(forKey: key)
    if setting == 0 {
      UserDefaults.standard.set(defaultValue, forKey: key)
      return defaultValue
    }
    return setting
  }

  static func boolSetting(key: String, defaultValue: Bool) -> Bool {
    let setting = UserDefaults.standard.bool(forKey: key)
    return setting
  }

  static func enumSetting<E: RawRepresentable>(key: String, defaultValue: E) -> E
    where E.RawValue == String
  {
    let setting = stringSetting(key: key, defaultValue: defaultValue.rawValue)
    return E(rawValue: setting) ?? defaultValue
  }
}

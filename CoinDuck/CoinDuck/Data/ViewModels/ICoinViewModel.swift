import Foundation

extension Coin {
  struct Price: CurrencyFormatDelegate {
    let value: Double
    let sign: String

    var formatted: String {
      formatPrice(value: value)
    }
  }

  struct Change: CurrencyFormatDelegate {
    let value: Double

    var formatted: String {
      formatPercentage(value: value)
    }

    var isUp: Bool {
      value >= 0 ? true : false
    }
  }

  struct UserPrefs {
    let showSubPrice: Bool
  }
}

///
/// ICoinViewModel
///
protocol ICoinViewModel: Identifiable, Equatable, CurrencyFormatDelegate {
  associatedtype Model: ICoin
  var model: Model { get }

  var coinId: String { get }
//  var dateUpdated: String { get }
  var name: String { get }
  var symbol: String { get }
  var rank: String { get }
  var price: Coin.Price { get }
  var subPrice: Coin.Price { get }
  var change: Coin.Change { get }
  var sparkline: [Coin.Price] { get }
  var iconUrl: URL { get }
  var backupIconUrl: URL { get }
  var userPrefs: Coin.UserPrefs { get }
}

extension ICoinViewModel {
  static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.coinId == rhs.coinId
  }
}

extension ICoinViewModel {
  // ID
  var coinId: String {
    guard let coinId = model.raw_coinId else {
      fatalError()
    }
    return coinId
  }

  // Dates
//  var dateUpdated: String {
//    let formatter = FormattersHelper.dateTimeFormatter
//    return formatter.string(from: coin.cd_dateUpdated ?? Date())
//  }

  // Titles
  var name: String {
    model.raw_name ?? ""
  }

  var symbol: String {
    model.raw_symbol ?? ""
  }

  var rank: String {
    "Rank \(model.raw_rank ?? 0)"
  }

  // Prices
  /// TODO: Implement sign later. Should come from Settings.
  /// TODO: Implement subPrice later.
  var price: Coin.Price {
    Coin.Price(value: model.raw_price ?? 0.0, sign: Coin.Currency.usd.sign)
  }

  var subPrice: Coin.Price {
    Coin.Price(value: 0.2, sign: Coin.SubCurrency.btc.sign)
  }

  var change: Coin.Change {
    Coin.Change(value: model.raw_change ?? 0.0)
  }

  var sparkline: [Coin.Price] {
    let nodes = model.raw_sparkline ?? []
    return nodes.map {
      Coin.Price(value: $0, sign: Coin.Currency.usd.rawValue)
    }
  }

  // Images
  var iconUrl: URL {
    var baseUrl = URL(string: Strings.cryptoIconsBaseUrl)!
    baseUrl.appendPathComponent(CryptoIconTheme.color.rawValue)
    baseUrl.appendPathComponent(symbol.lowercased())
    baseUrl.appendPathExtension("png")
    return baseUrl
  }

  var backupIconUrl: URL {
    guard let iconUrl = model.raw_iconUrl,
          let baseUrl = URL(string: String(iconUrl.absoluteString.dropLast(4)))
    else {
      return URL(string: Strings.blankIconUrl)!
    }
    return baseUrl.appendingPathExtension("png")
  }

  // User preferences
  /// TODO: Implement user preferences later. Should come from Settings.
  var userPrefs: Coin.UserPrefs {
    Coin.UserPrefs(
      showSubPrice: false
    )
  }
}

// REMOVE LATER
// private extension ICoinViewModel {
//  // TODO: This is expensive!
//  var dateFormatter: DateFormatter {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//  }
// }

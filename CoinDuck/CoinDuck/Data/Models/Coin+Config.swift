import CoreData

// MARK: - Config

extension Coin {
  /// Currency
  enum Currency: String, CaseIterable, ISettingChoice {
    case usd
    case eur
    case jpy
    case krw

    var key: String {
      rawValue
    }

    var title: String {
      switch self {
      case .usd: return "US Dollar"
      case .eur: return "Euro"
      case .jpy: return "Japanese Yen"
      case .krw: return "WON"
      }
    }

    var sign: String {
      switch self {
      case .usd: return "US$"
      case .eur: return "€"
      case .jpy: return "JP¥"
      case .krw: return "Won"
      }
    }
  }

  /// SubCurrency
  /// - Mapped to coinranking.com API.
  enum SubCurrency: String, CaseIterable {
    case btc

    var title: String {
      switch self {
      case .btc: return "Bitcoin"
      }
    }

    var id: String {
      switch self {
      case .btc: return "Qwsogvtv82FCd"
      }
    }

    var sign: String {
      switch self {
      case .btc: return "₿"
      }
    }
  }

  /// Period
  enum Period: String, CaseIterable {
    case day = "24h"
    case week = "7d"
    case month = "30d"
    case quarter = "3m"
    case year = "1y"
    case year3 = "3y"
    case year5 = "5y"
  }

  /// PeriodCoin
  enum PeriodCoin: String, CaseIterable {
    case day = "24h"
    case week = "7d"
    case month = "30d"
  }
}

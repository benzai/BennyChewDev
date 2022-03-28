import Combine
import Foundation

// MARK: - Endpoint

/// TODO: Add currency option.

extension CoinsAPIService {
  /// CoinRanking API
  enum CoinRanking {
    case coins(
      timePeriod: Coin.Period,
      limit: Int? = nil,
      offset: Int? = nil,
      uuids: [String]? = nil
    )
    case coin(
      coinId: String,
      timePeriod: Coin.PeriodCoin
    )
    case history(
      coinId: String,
      timePeriod: Coin.PeriodCoin
    )

    var endpoint: URL? {
      switch self {
      /// Coins
      case .coins(let timePeriod, let limit, let offset, let uuids):
        var components = CoinsAPIService.baseUrl("coins")
        components.queryItems?.append(URLQueryItem(name: "timePeriod", value: timePeriod.rawValue))
        if let limit = limit {
          components.queryItems?.append(URLQueryItem(name: "limit", value: String(limit)))
        }
        if let offset = offset {
          components.queryItems?.append(URLQueryItem(name: "offset", value: String(offset)))
        }
        if let uuids = uuids {
          for uuid in uuids {
            components.queryItems?.append(URLQueryItem(name: "uuids[]", value: uuid))
          }
        }
        return components.url

      /// Coin
      case .coin(let coinId, let timePeriod):
        var components = CoinsAPIService.baseUrl("coin/\(coinId)")
        components.queryItems?.append(URLQueryItem(name: "timePeriod", value: timePeriod.rawValue))
        return components.url

      /// History
      case .history(let coinId, let timePeriod):
        var components = CoinsAPIService.baseUrl("coin/\(coinId)/history")
        components.queryItems?.append(URLQueryItem(name: "timePeriod", value: timePeriod.rawValue))
        return components.url
      }
    }
  }

  static func baseUrl(_ subPath: String) -> URLComponents {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "api.coinranking.com"
    components.path = "/v2/\(subPath)"
    components.queryItems = [
      URLQueryItem(name: "x-access-token", value: CoinsAPIService.COINRANKING_API_KEY),
    ]
    return components
  }
}

import Combine
import Foundation

/// Coins response
struct CoinsResponse: Decodable {
  let totalCoins: Int
  let coins: [Coin]
}

extension CoinsResponse {
  enum CodingKeys: String, CodingKey {
    case data
  }

  enum DataKeys: String, CodingKey {
    case stats
    case coins
  }

  enum StatsKeys: String, CodingKey {
    case totalCoins
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let dataContainer = try container.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
    let stats = try dataContainer.nestedContainer(keyedBy: StatsKeys.self, forKey: .stats)
    var coinNodes = try dataContainer.nestedUnkeyedContainer(forKey: .coins)

    // stats
    self.totalCoins = try stats.decode(Int.self, forKey: .totalCoins)

    // coins
    var _coins: [Coin] = []
    while !coinNodes.isAtEnd {
      let coin = try coinNodes.decode(Coin.self)
      _coins += [coin]
    }
    self.coins = _coins
  }
}

/// Coin response
struct CoinResponse: Decodable {
  let coin: Coin
}

extension CoinResponse {
  enum CodingKeys: String, CodingKey {
    case data
  }

  enum DataKeys: String, CodingKey {
    case coin
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    let dataContainer = try container.nestedContainer(keyedBy: DataKeys.self, forKey: .data)
    let coin = try dataContainer.decode(Coin.self, forKey: .coin)
    self.coin = coin
  }
}

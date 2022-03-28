import Combine
import Foundation

extension CodingUserInfoKey {
  static let isCoinDetailDecoding = CodingUserInfoKey(rawValue: "isCoinDetailDecoding")!
}

extension CoinsAPIService {
  static let timePeriodDefault: Coin.Period = .day
  static let timePeriodCoinDefault: Coin.PeriodCoin = .day
  static let limitDefault = 100
  static let offsetDefault = 0
}

///
/// CoinsAPIService
///
final class CoinsAPIService {
  private var session = URLSession.shared

  private lazy var decoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    return decoder
  }()

  // Init
  init() {
    print("CoinAPIService init")
  }
}

// MARK: - Actions

extension CoinsAPIService {
  func getCoins(
    by page: Int,
    itemsPerPage limit: Int,
    timePeriod: Coin.Period = .day
  ) async throws -> [Coin] {
    let offset = (page - 1) * limit
    let endPoint = CoinRanking.coins(timePeriod: timePeriod, limit: limit, offset: offset).endpoint!

    do {
      let (data, _) = try await session.data(from: endPoint)
      decoder.userInfo[.isCoinDetailDecoding] = nil
      let coinsResponse = try decoder.decode(CoinsResponse.self, from: data)
      return coinsResponse.coins
    } catch let error {
      /// TODO: Handle error!
      print(error)
      return []
    }
  }

  func getCoinsInBatches(
    startPage: Int = 1,
    pages: Int,
    itemsPerPage limit: Int,
    timePeriod: Coin.Period = .day
  ) async throws -> [Coin] {
    var allCoins: [Coin] = []
    for page in startPage ... pages {
      do {
        let coins = try await getCoins(by: page, itemsPerPage: limit, timePeriod: timePeriod)
        allCoins += coins
      } catch {
        /// TODO: Handle error!
        print(error)
      }
    }
    return allCoins
  }

  func getCoinsById(
    coinIds: [String],
    timePeriod: Coin.Period = .day
  ) async throws -> [Coin] {
    let endPoint = CoinRanking.coins(timePeriod: timePeriod, uuids: coinIds).endpoint!

    do {
      let (data, _) = try await session.data(from: endPoint)
      decoder.userInfo[.isCoinDetailDecoding] = nil
      let coinsResponse = try decoder.decode(CoinsResponse.self, from: data)
      return coinsResponse.coins
    } catch {
      /// TODO: Handle error!
      print(error)
      return []
    }
  }

  func getCoin(
    coinId: String,
    timePeriod: Coin.PeriodCoin = .day
  ) async throws -> Coin {
    let endPoint = CoinRanking.coin(coinId: coinId, timePeriod: timePeriod).endpoint!
    print(endPoint)
    let request = URLRequest(url: endPoint)
    let (data, _) = try await session.data(with: request)
    decoder.userInfo[.isCoinDetailDecoding] = true
    let coinResponse = try decoder.decode(CoinResponse.self, from: data)
    return coinResponse.coin
  }
}

// MARK: - Helpers

private extension CoinsAPIService {}

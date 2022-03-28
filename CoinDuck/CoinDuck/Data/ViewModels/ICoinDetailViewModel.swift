import Foundation

///
/// ICoinDetailViewModel
///
protocol ICoinDetailViewModel: Identifiable, CurrencyFormatDelegate {
  var coin: Coin { get }

  var description: String { get }
  var websiteUrl: URL { get }
  var links: [Coin.Link] { get }
  var stats: [Coin.Stat] { get }

  var statMarketCapFormatted: Double { get }
  var statVolume24Formatted: Double { get }
  var statCirculatingSupplyFormatted: Double { get }
  var statTotalSupplyFormatted: Double { get }
  var statAllTimeHighFormatted: Double { get }
}

extension ICoinDetailViewModel {
  var description: String {
    coin.raw_detail?.description ?? ""
  }

  var websiteUrl: URL {
    coin.raw_detail?.websiteUrl ?? URL(string: Strings.defaultCoinUrl)!
  }

  var links: [Coin.Link] {
//    coin.opt_detail?.links ?? []
    []
  }

  var statMarketCapFormatted: Double {
    10000
  }

  var statVolume24Formatted: Double {
    10000
  }

  var statCirculatingSupplyFormatted: Double {
    10000
  }

  var statTotalSupplyFormatted: Double {
    10000
  }

  var statAllTimeHighFormatted: Double {
    10000
  }

  var stats: [Coin.Stat] {
    [
//      Coin.Stat(title: "Rank", value: "\(coin.rank)"),
//      Coin.Stat(title: "Markets", value: "\(coin.opt_detail?.statMarkets ?? 0)"),
//      Coin.Stat(title: "Exchanges", value: "\(coin.opt_detail?.statExchanges ?? 0)"),
      Coin.Stat(title: "Market Cap", value: "\(statMarketCapFormatted)"),
      Coin.Stat(title: "24h Volume", value: "\(statVolume24Formatted)"),
      Coin.Stat(title: "Circulating Supply", value: "\(statCirculatingSupplyFormatted)"),
      Coin.Stat(title: "Total Supply", value: "\(statTotalSupplyFormatted)"),
//      Coin.Stat(
//        title: "All Time High",
//        value: "\(statAllTimeHighFormatted)",
//        date: coin.opt_detail?.statAllTimeHighDate ?? Date()
//      ),
    ]
  }
}

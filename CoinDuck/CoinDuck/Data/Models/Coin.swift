import CoreData

/// Coin
struct Coin: ICoin, Decodable {
  let raw_coinId: String?
  let raw_name: String?
  let raw_symbol: String?
  let raw_rank: Int?

  let raw_price: Double?
  let raw_change: Double?
  let raw_sparkline: [Double]?

  let raw_iconUrl: URL?
  let raw_color: String?

  // Coin Detail
  let raw_detail: Coin.Detail?
}

extension Coin {
  var id: String {
    guard let id = raw_coinId else {
      fatalError()
    }
    return id
  }
}

extension Coin {
  enum CodingKeys: String, CodingKey {
    case uuid
    case name
    case symbol
    case rank

    case price
    case change
    case sparkline

    case iconUrl
    case color

    // Coin Detail
    case description
    case websiteUrl
    case numberOfMarkets
    case numberOfExchanges
    case marketCap
    case volume = "24hVolume"
    case supply
    case allTimeHigh
    case links
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.raw_coinId = try container.decode(String.self, forKey: .uuid)
    self.raw_name = try container.decode(String.self, forKey: .name)
    self.raw_symbol = try container.decode(String.self, forKey: .symbol)
    self.raw_rank = try container.decode(Int.self, forKey: .rank)

    let priceString = (try? container.decode(String.self, forKey: .price)) ?? "0.0"
    self.raw_price = Double(priceString) ?? 0.0
    let changeString = (try? container.decode(String.self, forKey: .change)) ?? "0.0"
    self.raw_change = Double(changeString) ?? 0.0
    let sparklineStrings = (try? container.decode([String].self, forKey: .sparkline)) ?? []
    self.raw_sparkline = sparklineStrings.map { Double($0) ?? 0.0 }

    self.raw_iconUrl = try? container.decode(URL.self, forKey: .iconUrl)
    self.raw_color = try? container.decode(String.self, forKey: .color)

    // Coin Detail
    if let isCoinDetailDecoding = decoder.userInfo[.isCoinDetailDecoding] as? Bool, isCoinDetailDecoding != false {
      print("isCoinDetailDecoding")
      let description = try? container.decode(String.self, forKey: .description)
      let websiteUrl = try? container.decode(URL.self, forKey: .websiteUrl)

      let statMarkets = (try? container.decode(Int.self, forKey: .numberOfMarkets)) ?? 0
      let statExchanges = (try? container.decode(Int.self, forKey: .numberOfExchanges)) ?? 0
      let statMarketCapString = (try? container.decode(String.self, forKey: .marketCap)) ?? "0.0"
      let statMarketCap = Double(statMarketCapString) ?? 0.0
      let statVolume24String = (try? container.decode(String.self, forKey: .volume)) ?? "0.0"
      let statVolume24 = Double(statVolume24String) ?? 0.0

      var statCirculatingSupply: Double = 0.0
      var statTotalSupply: Double = 0.0
      if let supply = try? container.decode(Coin.Supply.self, forKey: .supply) {
        statCirculatingSupply = Double(supply.circulating ?? "0.0") ?? 0.0
        statTotalSupply = Double(supply.total ?? "0.0") ?? 0.0
      }

      var statAllTimeHigh: Double = 0.0
      var statAllTimeHighDate: Date? = nil
      if let allTimeHigh = try? container.decode(Coin.AllTimeHigh.self, forKey: .allTimeHigh) {
        statAllTimeHigh = Double(allTimeHigh.price ?? "0.0") ?? 0.0
        statAllTimeHighDate = allTimeHigh.timestamp
      }

      let links = (try? container.decode([Coin.Link].self, forKey: .links)) ?? []

      self.raw_detail = Coin.Detail(
        description: description,
        websiteUrl: websiteUrl,
        links: links,
        statMarkets: statMarkets,
        statExchanges: statExchanges,
        statMarketCap: statMarketCap,
        statVolume24: statVolume24,
        statCirculatingSupply: statCirculatingSupply,
        statTotalSupply: statTotalSupply,
        statAllTimeHigh: statAllTimeHigh,
        statAllTimeHighDate: statAllTimeHighDate
      )
    } else {
      self.raw_detail = nil
    }
  }
}

// Coin Detail Helpers
extension Coin {
  struct Link: Decodable {
    let name: String
    let url: URL
    let type: String?
  }

  struct Supply: Decodable {
    let circulating: String?
    let total: String?
  }

  struct AllTimeHigh: Decodable {
    let price: String?
    let timestamp: Date?
  }
}

extension Coin {
  struct Stat {
    let title: String
    let value: String
    let date: Date?

    init(title: String, value: String, date: Date? = nil) {
      self.title = title
      self.value = value
      self.date = date
    }

    var dateFormatted: String? {
      if let date = date {
        return FormattersHelper.dateFormatter.string(from: date)
      } else {
        return nil
      }
    }
  }

  struct Detail {
    var description: String?
    var websiteUrl: URL?
    var links: [Coin.Link]
    var statMarkets: Int
    var statExchanges: Int
    var statMarketCap: Double
    var statVolume24: Double
    var statCirculatingSupply: Double
    var statTotalSupply: Double
    var statAllTimeHigh: Double
    var statAllTimeHighDate: Date?

    init(
      description: String?,
      websiteUrl: URL?,
      links: [Coin.Link],
      statMarkets: Int,
      statExchanges: Int,
      statMarketCap: Double,
      statVolume24: Double,
      statCirculatingSupply: Double,
      statTotalSupply: Double,
      statAllTimeHigh: Double,
      statAllTimeHighDate: Date?
    ) {
      self.description = description
      self.websiteUrl = websiteUrl
      self.links = links
      self.statMarkets = statMarkets
      self.statExchanges = statExchanges
      self.statMarketCap = statMarketCap
      self.statVolume24 = statVolume24
      self.statCirculatingSupply = statCirculatingSupply
      self.statTotalSupply = statTotalSupply
      self.statAllTimeHigh = statAllTimeHigh
      self.statAllTimeHighDate = statAllTimeHighDate
    }
  }
}

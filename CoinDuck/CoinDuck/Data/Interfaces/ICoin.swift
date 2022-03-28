import Foundation

///
/// ICoin
///
protocol ICoin {
  var raw_coinId: String? { get }
  var raw_name: String? { get }
  var raw_symbol: String? { get }
  var raw_rank: Int? { get }

  var raw_price: Double? { get }
  var raw_change: Double? { get }
  var raw_sparkline: [Double]? { get }

  var raw_iconUrl: URL? { get }
  var raw_color: String? { get }

  var raw_detail: Coin.Detail? { get }
}

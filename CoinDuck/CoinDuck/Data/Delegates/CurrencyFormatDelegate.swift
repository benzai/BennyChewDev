import Foundation

///
/// CurrencyFormatDelegate
///
public protocol CurrencyFormatDelegate {
  func convertToSubCurrencyPrice(subCurrencyPrice: Double, value: Double) -> Double
  func formatPrice(value: Double, fractionDigits: Int?) -> String
  func formatPercentage(value: Double) -> String
}

public extension CurrencyFormatDelegate {
  func convertToSubCurrencyPrice(subCurrencyPrice: Double, value: Double) -> Double {
    value / subCurrencyPrice
  }

  func formatPrice(value: Double, fractionDigits: Int? = nil) -> String {
    // REMOVE LATER
//    let formatter = NumberFormatter()
//    formatter.usesGroupingSeparator = true
//    formatter.numberStyle = .decimal
//    formatter.locale = Locale.current

    let formatter = FormattersHelper.priceFormatter

    guard let fractionDigits = fractionDigits else {
      switch value {
      case let x where x >= 10:
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
      case let x where x <= 0.00009999:
        formatter.minimumFractionDigits = 4
        formatter.maximumFractionDigits = 5
      default:
        formatter.minimumFractionDigits = 4
        formatter.maximumFractionDigits = 4
      }

      return formatter.string(from: NSNumber(value: value)) ?? ""
    }

    formatter.minimumFractionDigits = fractionDigits
    formatter.maximumFractionDigits = fractionDigits
    return formatter.string(from: NSNumber(value: value)) ?? ""
  }

  func formatPercentage(value: Double) -> String {
    // REMOVE LATER
//    let formatter = NumberFormatter()
//    formatter.usesGroupingSeparator = true
//    formatter.numberStyle = .percent
//    formatter.locale = Locale.current
//    formatter.minimumFractionDigits = 0
//    formatter.maximumFractionDigits = 4

    let formatter = FormattersHelper.percentageFormatter
    return formatter.string(from: NSNumber(value: value)) ?? ""
  }
}

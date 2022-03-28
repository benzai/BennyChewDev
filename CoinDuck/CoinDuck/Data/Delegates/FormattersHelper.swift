import Foundation

final class FormattersHelper {
  static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
  }()

  static let dateTimeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
  }()

  static let priceFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.usesGroupingSeparator = true
    formatter.numberStyle = .decimal
    formatter.locale = Locale.current
    return formatter
  }()

  static let percentageFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.usesGroupingSeparator = true
    formatter.numberStyle = .percent
    formatter.locale = Locale.current
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 4
    return formatter
  }()
}

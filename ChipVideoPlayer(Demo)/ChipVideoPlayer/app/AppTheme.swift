import UIKit
import SwiftUI
import Combine
import Rswift

///
/// AppTheme
///
final class AppTheme: ObservableObject {
  static let shared = AppTheme()

  // State
  @Published var colors: ColorTheme = LightTheme()

  private init() {}
}

// MARK: - ColorTheme

protocol ColorTheme {
  var accent1: Color { get }
  var accent2: Color { get }
  var text1: Color { get }
  var text2: Color { get }
  var text3: Color { get }
  var altText1: Color { get }
  var altText2: Color { get }
  var altText3: Color { get }
  var bg1: Color { get }
  var bg2: Color { get }
  var altBg1: Color { get }
  var statusPositive: Color { get }
  var statusWarning: Color { get }
  var statusNegative: Color { get }
}

struct LightTheme: ColorTheme {
  var accent1: Color { Color("#373DFA") }
  var accent2: Color { Color("#02BFEC") }
  var text1: Color { Color("#263340") }
  var text2: Color { Color("#6B8299") }
  var text3: Color { Color("#99ACBF") }
  var altText1: Color { Color("#FCFCFC") }
  var altText2: Color { Color("#FCFCFC") }
  var altText3: Color { Color("#FCFCFC") }
  var bg1: Color { Color("#FCFCFC") }
  var bg2: Color { Color("#E9EBED") }
  var altBg1: Color { Color("#394566") }
  var statusPositive: Color { Color("#51D191") }
  var statusWarning: Color { Color("#FF5901") }
  var statusNegative: Color { Color("#FF5959") }
}

// struct DarkTheme: ColorTheme {}

// MARK: - Configuration

extension AppTheme {
  /// ColorTint
  enum ColorTint {
    case custom(Color)
    case accent1
    case accent2
    case text1
    case text2
    case text3
    case altText1
    case altText2
    case altText3
    case bg1
    case bg2
    case altBg1
    case statusPositive
    case statusWarning
    case statusNegative

    var color: Color {
      let colors = AC.shared.theme.colors
      switch self {
      case .custom(let color): return color
      case .accent1: return colors.accent1
      case .accent2: return colors.accent2
      case .text1: return colors.text1
      case .text2: return colors.text2
      case .text3: return colors.text3
      case .altText1: return colors.altText1
      case .altText2: return colors.altText2
      case .altText3: return colors.altText3
      case .bg1: return colors.bg1
      case .bg2: return colors.bg2
      case .altBg1: return colors.altBg1
      case .statusPositive: return colors.statusPositive
      case .statusWarning: return colors.statusWarning
      case .statusNegative: return colors.statusNegative
      }
    }

    var uiColor: UIColor {
      color.uiColor()
    }
  }

  /// FontFamily
  enum FontFamily {
    case regular
    case medium
    case bold

    /// R.swift font resources.
    var resource: FontResource {
      switch self {
      case .regular: return R.font.gtWalsheimPro
      case .medium: return R.font.gtWalsheimProMedium
      case .bold: return R.font.gtWalsheimProBold
      }
    }

    var name: String {
      resource.fontName
    }
  }

  /// FontSize
  enum FontSize {
    /// Custom
    case custom(CGFloat)
    /// 48
    case xl
    /// 40
    case lg
    /// 32
    case lg2
    /// 24
    case lg3
    /// 20
    case md
    /// 18
    case md2
    /// 16
    case md3
    /// 14
    case sm
    /// 13
    case sm2
    /// 12
    case sm3
    /// 11
    case xs

    var value: (size: CGFloat, kerning: CGFloat) {
      switch self {
      case .custom(let size): return (size: size, kerning: 0)
      case .xl: return (size: 48, kerning: -1.4)
      case .lg: return (size: 40, kerning: -1)
      case .lg2: return (size: 32, kerning: -0.7)
      case .lg3: return (size: 24, kerning: -0.4)
      case .md: return (size: 20, kerning: -0.3)
      case .md2: return (size: 18, kerning: -0.3)
      case .md3: return (size: 16, kerning: -0.1)
      case .sm: return (size: 14, kerning: 0)
      case .sm2: return (size: 13, kerning: 0)
      case .sm3: return (size: 12, kerning: 0)
      case .xs: return (size: 11, kerning: 0)
      }
    }
  }

  /// FontWeight
  enum FontWeight {
    case regular
    case medium
    case bold

    /// Custom font
    var custom: String {
      switch self {
      case .regular: return FontFamily.regular.name
      case .medium: return FontFamily.medium.name
      case .bold: return FontFamily.bold.name
      }
    }

    /// System font
    var system: Font.Weight {
      switch self {
      case .regular: return Font.Weight.regular
      case .medium: return Font.Weight.medium
      case .bold: return Font.Weight.bold
      }
    }

    /// System font (UIKit)
    var systemUIKit: UIFont.Weight {
      switch self {
      case .regular: return UIFont.Weight.regular
      case .medium: return UIFont.Weight.medium
      case .bold: return UIFont.Weight.bold
      }
    }
  }
}

// MARK: - UIKit Helpers

extension AppTheme {
  /// UIFont
  static func makeFont(
    weight: FontWeight = .regular,
    size: FontSize = .md
  ) -> UIFont {
    guard let font = UIFont(name: weight.custom, size: size.value.size) else {
      return UIFont.systemFont(ofSize: size.value.size, weight: weight.systemUIKit)
    }
    return font
  }

  /// UILabel
  static func makeLabel(
    weight: FontWeight = .regular,
    size: FontSize,
    color: ColorTint
  ) -> UILabel {
    let label = UILabel()
    label.font = makeFont(weight: weight, size: size)
    label.textColor = color.color.uiColor()
    return label
  }

  /// NSAttributedString TextStyle
  static func makeTextStyle(
    weight: FontWeight = .regular,
    size: FontSize = .md,
    kerning: CGFloat = 0,
    color: ColorTint,
    alpha: CGFloat = 1,
    disableKern: Bool = false
  ) -> [NSAttributedString.Key: Any] {
    let kern = disableKern ? 0 : kerning
    let textStyle: [NSAttributedString.Key: Any] = [
      .font: makeFont(weight: weight, size: size),
      .kern: kern,
      .foregroundColor: color.color.uiColor(),
    ]
    return textStyle
  }

  /// NSAttributedString
  static func makeAttrString(
    with text: String,
    weight: FontWeight = .regular,
    size: FontSize = .md,
    color: ColorTint,
    alpha: CGFloat = 1,
    disableKern: Bool = false
  ) -> NSAttributedString {
    let textStyle: [NSAttributedString.Key: Any] = makeTextStyle(
      weight: weight,
      size: size,
      kerning: size.value.kerning,
      color: color,
      alpha: alpha,
      disableKern: disableKern
    )

    return NSAttributedString(string: text, attributes: textStyle)
  }
}

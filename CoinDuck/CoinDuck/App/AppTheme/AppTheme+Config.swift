import Rswift
import SwiftUI
import UIKit

// MARK: - Config

extension AppTheme {
  /// FontFamily
  enum FontFamily {
    case regular, medium, bold

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
    case xl, lg, lg2, lg3, md, md2, md3, sm, sm2, sm3, xs, custom(CGFloat)

    var value: (size: CGFloat, kerning: CGFloat) {
      switch self {
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
      case .custom(let size): return (size: size, kerning: 0)
      }
    }
  }

  /// FontWeight
  enum FontWeight {
    case regular, medium, bold

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

// MARK: - Components

extension AppTheme {
  enum ButtonSize {
    case sm, md, lg

    var value: (frameHeight: CGFloat, sidePadding: CGFloat, textSize: AppTheme.FontSize) {
      switch self {
      case .sm: return (frameHeight: 40, sidePadding: 8, textSize: .md3)
      case .md: return (frameHeight: 48, sidePadding: 12, textSize: .md2)
      case .lg: return (frameHeight: 56, sidePadding: 16, textSize: .md)
      }
    }
  }
}

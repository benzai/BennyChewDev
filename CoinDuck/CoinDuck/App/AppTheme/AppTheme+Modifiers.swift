import Combine
import Rswift
import SwiftUI
import UIKit

// MARK: - Modifiers

struct AppFontModifier: ViewModifier {
  let weight: AppTheme.FontWeight
  let size: AppTheme.FontSize
  let color: Color
  let lineSpacing: CGFloat
  let systemFont: Bool

  init(
    weight: AppTheme.FontWeight = .regular,
    size: AppTheme.FontSize,
    color: Color,
    lineSpacing: CGFloat = 1,
    systemFont: Bool
  ) {
    self.weight = weight
    self.size = size
    self.color = color
    self.lineSpacing = lineSpacing
    self.systemFont = systemFont
  }

  func body(content: Content) -> some View {
    if systemFont {
      content
        .font(.system(size: size.value.size, weight: weight.system, design: .default))
        .foregroundColor(color)
    } else {
      content
        .font(.custom(weight.custom, size: size.value.size))
        .foregroundColor(color)
    }
  }
}

extension Text {
  func appFont(
    weight: AppTheme.FontWeight = .regular,
    size: AppTheme.FontSize,
    color: Color,
    lineSpacing: CGFloat = 1,
    isParagraph: Bool = false,
    systemFont: Bool = false
  ) -> some View {
    let base = kerning(!systemFont ? size.value.kerning : 0)
      .modifier(AppFontModifier(weight: weight, size: size, color: color, systemFont: systemFont))
    let paragraph = base.lineSpacing(lineSpacing)
    let normal = base.frame(height: lineSpacing * size.value.size)
    return isParagraph ? paragraph.eraseToAnyView() : normal.eraseToAnyView()
  }
}

extension Button {
  func appFont(
    weight: AppTheme.FontWeight = .regular,
    size: AppTheme.FontSize,
    color: Color,
    lineSpacing: CGFloat = 1,
    systemFont: Bool = false
  ) -> some View {
    self.modifier(AppFontModifier(weight: weight, size: size, color: color, systemFont: systemFont))
      .frame(height: lineSpacing * size.value.size)
  }
}

// MARK: - UIKit Builder

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
    color: Color
  ) -> UILabel {
    let label = UILabel()
    label.font = makeFont(weight: weight, size: size)
    label.textColor = color.uiColor()
    return label
  }

  /// NSAttributedString TextStyle
  static func makeTextStyle(
    weight: FontWeight = .regular,
    size: FontSize = .md,
    kerning: CGFloat = 0,
    color: Color,
    alpha: CGFloat = 1,
    disableKern: Bool = false
  ) -> [NSAttributedString.Key: Any] {
    let kern = disableKern ? 0 : kerning
    let textStyle: [NSAttributedString.Key: Any] = [
      .font: makeFont(weight: weight, size: size),
      .kern: kern,
      .foregroundColor: color.uiColor(),
    ]
    return textStyle
  }

  /// NSAttributedString
  static func makeAttrString(
    with text: String,
    weight: FontWeight = .regular,
    size: FontSize = .md,
    color: Color,
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

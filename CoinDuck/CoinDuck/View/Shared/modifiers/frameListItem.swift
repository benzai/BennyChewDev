import SwiftUI

///
/// FrameListItemMod
///
public struct FrameListItemMod: ViewModifier {
  public enum LineStyle {
    case solid, dotted
  }

  private let height: CGFloat?
  private let lineStyle: LineStyle
  private let lineWidth: CGFloat
  private let lineColor: Color
  private let sidePadding: CGFloat
  private let roundness: CGFloat

  init(
    height: CGFloat?,
    lineStyle: LineStyle = .solid,
    lineWidth: CGFloat = 1,
    lineColor: Color = Color.black.opacity(0.1),
    sidePadding: CGFloat = 10,
    roundness: CGFloat = 8
  ) {
    self.height = height
    self.lineStyle = lineStyle
    self.lineWidth = lineWidth
    self.lineColor = lineColor
    self.sidePadding = sidePadding
    self.roundness = roundness
  }

  public func body(content: Content) -> some View {
    let _lineStyle = lineStyle == .dotted ?
      dotted(lineWidth: lineWidth, lineColor: lineColor).eraseToAnyView() :
      solid(lineWidth: lineWidth, lineColor: lineColor).eraseToAnyView()

    return content
      .padding(.horizontal, sidePadding)
      .frame(maxWidth: .infinity, alignment: .leading)
      .frame(height: height)
      .cornerRadius(roundness)
      .overlay(_lineStyle)
  }

  private func solid(lineWidth: CGFloat, lineColor: Color) -> some View {
    RoundedRectangle(cornerRadius: roundness)
      .stroke(lineColor, lineWidth: lineWidth)
  }

  private func dotted(lineWidth: CGFloat, lineColor: Color) -> some View {
    RoundedRectangle(cornerRadius: roundness)
      .strokeBorder(
        style: StrokeStyle(
          lineWidth: lineWidth,
          dash: [3]
        )
      )
      .foregroundColor(lineColor)
  }
}

public extension View {
  /// Set the frame to appear like a list item.
  func frameListItem(
    height: CGFloat? = nil,
    lineStyle: FrameListItemMod.LineStyle = .solid,
    lineWidth: CGFloat = 1,
    lineColor: Color = Color.black.opacity(0.1),
    sidePadding: CGFloat = 10,
    roundness: CGFloat = 8
  ) -> some View {
    modifier(FrameListItemMod(
      height: height,
      lineStyle: lineStyle,
      lineWidth: lineWidth,
      lineColor: lineColor,
      sidePadding: sidePadding,
      roundness: roundness
    ))
  }
}

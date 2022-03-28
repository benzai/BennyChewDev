import SwiftUI

///
/// FrameDecorationViewMod
///
public struct FrameDecorationViewMod: ViewModifier {
  private let size: CGFloat
  private let color: Color
  private let opacity: Double
  private let offset: CGFloat

  public init(
    size: CGFloat = 1,
    color: Color,
    opacity: Double = 0.1,
    offset: CGFloat = 0
  ) {
    self.size = size
    self.color = color
    self.opacity = opacity
    self.offset = offset
  }

  public func body(content: Content) -> some View {
    ZStack(alignment: .bottomLeading) {
      content
      Rectangle()
        .frame(maxWidth: .infinity)
        .frame(height: size)
        .foregroundColor(color.opacity(opacity))
        .offset(x: offset)
    }
  }
}

public extension View {
  /// Creates a bottom separator. You can use this for list items.
  func lineSeparator(
    size: CGFloat = 1,
    color: Color,
    opacity: Double = 0.1,
    offset: CGFloat = 0
  ) -> some View {
    modifier(FrameDecorationViewMod(size: size, color: color, opacity: opacity, offset: offset))
  }
}

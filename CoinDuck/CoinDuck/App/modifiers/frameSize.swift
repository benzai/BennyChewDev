import SwiftUI

///
/// FrameSizeViewMod
///
public struct FrameSizeViewMod: ViewModifier {
  private let size: CGFloat

  init(_ size: CGFloat) {
    self.size = size
  }

  public func body(content: Content) -> some View {
    content
      .frame(width: size, height: size)
  }
}

public extension View {
  /// Set the frame width and height to the same value.
  func frameSize(_ size: CGFloat) -> some View {
    modifier(FrameSizeViewMod(size))
  }
}

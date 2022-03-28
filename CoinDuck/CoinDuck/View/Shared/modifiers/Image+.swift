import SwiftUI

///
/// Image Extensions
///
public extension Image {
  /// Circular image.
  func circularImage(size: CGFloat = 40) -> some View {
    self
      .resizable()
      .aspectRatio(contentMode: .fit)
      .clipShape(Circle())
      .frame(width: size, height: size)
  }

  /// Rounded image
  func roundedImage(size: CGFloat = 40, roundness: CGFloat = 8) -> some View {
    self
      .resizable()
      .aspectRatio(contentMode: .fit)
      .clipShape(RoundedRectangle(cornerRadius: roundness))
      .frame(width: size, height: size)
  }

  /// Icon
  func icon(size: CGFloat = 24, color: Color) -> some View {
    self
      .renderingMode(.template)
      .resizable()
      .frame(width: size, height: size)
      .foregroundColor(color)
  }
}

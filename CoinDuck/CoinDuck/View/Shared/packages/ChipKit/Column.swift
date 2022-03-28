import SwiftUI

///
/// Column
/// - HStack with a default spacing of 0.
///
public struct Column<Content>: View where Content: View {
  private let alignment: VerticalAlignment
  private let spacing: CGFloat
  private let content: Content

  public init(
    alignment: VerticalAlignment = .center,
    spacing: CGFloat = 0,
    @ViewBuilder content: () -> Content
  ) {
    self.alignment = alignment
    self.spacing = spacing
    self.content = content()
  }

  public var body: some View {
    HStack(alignment: alignment, spacing: spacing) {
      content
    }
  }
}

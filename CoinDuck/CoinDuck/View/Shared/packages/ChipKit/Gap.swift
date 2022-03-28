import SwiftUI

///
/// HGap
/// - Horizontal spacer.
///
public struct HGap: View {
  private let space: CGFloat

  public init(_ space: CGFloat = 10) {
    self.space = space
  }

  public var body: some View {
    Spacer().frame(width: space)
  }
}

///
/// VGap
/// - Vertical spacer.
///
public struct VGap: View {
  private let space: CGFloat

  public init(_ space: CGFloat = 10) {
    self.space = space
  }

  public var body: some View {
    Spacer().frame(height: space)
  }
}

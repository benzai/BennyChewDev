import SwiftUI

///
/// PageScaffold
///
public struct PageScaffold<Content>: View where Content: View {
  @EnvironmentObject private var theme: AppTheme

  private let backgroundColor: Color
  private let content: Content

  public init(
    backgroundColor: Color = .white,
    @ViewBuilder content: () -> Content
  ) {
    self.backgroundColor = backgroundColor
    self.content = content()
  }

  public var body: some View {
    Row {
      content
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(backgroundColor)
    .edgesIgnoringSafeArea(.horizontal)
  }
}

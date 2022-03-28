import SwiftUI

///
/// ClassicButton
///
struct ClassicButton: View {
  @EnvironmentObject private var theme: AppTheme

  typealias OnTap = () -> Void
  private let title: String
  private let size: AppTheme.ButtonSize
  private let frameColor: Color
  private let textColor: Color
  private let roundness: CGFloat
  private let flexible: Bool
  private let systemFont: Bool
  private let onTap: OnTap

  init(
    _ title: String,
    size: AppTheme.ButtonSize = .md,
    frameColor: Color,
    textColor: Color,
    roundness: CGFloat = 12,
    flexible: Bool = false,
    systemFont: Bool = false,
    onTap: @escaping OnTap
  ) {
    self.title = title
    self.size = size
    self.frameColor = frameColor
    self.textColor = textColor
    self.roundness = roundness
    self.flexible = flexible
    self.systemFont = systemFont
    self.onTap = onTap
  }

  var body: some View {
    Button(action: onTap) {
      Text(title)
        .appFont(size: size.value.textSize, color: textColor, systemFont: systemFont)
        .padding(.horizontal, size.value.sidePadding)
        .frame(maxWidth: flexible ? .infinity : nil)
        .frame(height: size.value.frameHeight)
    }
    .background(frameColor)
    .cornerRadius(roundness)
  }
}

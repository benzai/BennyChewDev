import SDWebImageSwiftUI
import SwiftUI

///
/// SettingChoiceCell
///
struct SettingChoiceCell: View {
  @Environment(\.presentationMode) private var presentationMode
  @Environment(\.colorScheme) private var colorScheme
  @EnvironmentObject private var theme: AppTheme

  // State

  // Init
  typealias OnTap = (Setting, ISettingChoice) -> Void
  private let setting: Setting
  private let settingValue: ISettingChoice
  private let isActive: Bool
  private let frameHeight: CGFloat
  private let showSeparator: Bool
  private let onTap: OnTap

  init(
    setting: Setting,
    settingValue: ISettingChoice,
    isActive: Bool = false,
    frameHeight: CGFloat = 56,
    showSeparator: Bool = true,
    onTap: @escaping OnTap
  ) {
    self.setting = setting
    self.settingValue = settingValue
    self.isActive = isActive
    self.frameHeight = frameHeight
    self.showSeparator = showSeparator
    self.onTap = onTap
  }

  var body: some View {
    Column {
      Text(settingValue.title)
        .appFont(size: .md2, color: theme.colors.text1)
        .offset(x: 0, y: -2)

      Spacer()

      if isActive {
        HGap(10)

        Image(R.image.icon24Check.name)
          .resizable()
          .renderingMode(.template)
          .foregroundColor(theme.colors.accent1)
          .frameSize(24)
      }
    }
    .padding(.horizontal, 10)
    .frame(maxWidth: .infinity, alignment: .leading)
    .frame(height: frameHeight)
    .background(theme.colors.card1)
    .lineSeparator(color: theme.colors.line1, opacity: showSeparator ? 0.1 : 0, offset: 10)

    .onTapGesture {
      onTap(setting, settingValue)
    }
  }
}

// MARK: - Views

private extension SettingChoiceCell {}

// MARK: - Previews

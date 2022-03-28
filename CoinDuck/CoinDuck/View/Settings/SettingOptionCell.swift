import SDWebImageSwiftUI
import SwiftUI

protocol ISettingChoice {
  /// Has to exactly match the rawValue.
  var key: String { get }
  var title: String { get }
}

// extension ISettingChoice

extension SettingOptionCell {
  enum InputType {
    case singleChoice
    case pageLink
    case action
    case boolean
  }
}

///
/// SettingOptionCell
///
struct SettingOptionCell: View {
  @Environment(\.presentationMode) private var presentationMode
  @Environment(\.colorScheme) private var colorScheme
  @EnvironmentObject private var theme: AppTheme

  // State

  // Init
  typealias OnTap = (Setting) -> Void
  private let setting: Setting
  private let type: InputType
  private let title: String
  private let value: String?
  private let frameHeight: CGFloat
  private let showSeparator: Bool
  private let onTap: OnTap

  init(
    setting: Setting,
    type: InputType,
    title: String,
    value: String?,
    frameHeight: CGFloat = 48,
    showSeparator: Bool = true,
    onTap: @escaping OnTap
  ) {
    self.setting = setting
    self.type = type
    self.title = title
    self.value = value
    self.frameHeight = frameHeight
    self.showSeparator = showSeparator
    self.onTap = onTap
  }

  var body: some View {
    Column {
      Text(title)
        .appFont(size: .md2, color: theme.colors.text1)
//        .offset(x: 0, y: -2)

      Spacer()

      if let value = value {
        Text(value)
          .appFont(size: .md3, color: theme.colors.accent1)

        HGap(10)
      }

      Image(R.image.icon_arrow_left.name)
        .resizable()
        .renderingMode(.template)
        .foregroundColor(theme.colors.text3) // TODO: change to icon color
        .frameSize(24)
    }
    .padding(.horizontal, 10)
    .frame(maxWidth: .infinity, alignment: .leading)
    .frame(height: frameHeight)
    .background(theme.colors.card1)
    .lineSeparator(color: theme.colors.line1, opacity: showSeparator ? 0.1 : 0, offset: 10)

    .onTapGesture {
      onTap(setting)
    }
  }
}

// MARK: - Views

private extension SettingOptionCell {}

// MARK: - Previews

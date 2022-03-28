import SwiftUI

///
/// SettingsPickerPage
///
struct SettingsPickerPage<T: ISettingChoice>: View {
  @Environment(\.horizontalSizeClass) private var sizeClass
  @Environment(\.presentationMode) private var presentationMode
  @Environment(\.colorScheme) private var colorScheme
  @EnvironmentObject private var settings: AppSettings
  @EnvironmentObject private var theme: AppTheme

  // State

  // Init
  typealias OnItemTapHandler = (Setting, ISettingChoice) -> Void
  private let setting: Setting
  @Binding private var activeItem: T
  private let items: [T]
  private let onItemTap: OnItemTapHandler

  init(
    setting: Setting,
    activeItem: Binding<T>,
    items: [T],
    onItemTap: @escaping OnItemTapHandler
  ) {
    self.setting = setting
    self._activeItem = activeItem
    self.items = items
    self.onItemTap = onItemTap
  }

  var body: some View {
    PageScaffold(backgroundColor: theme.colors.bg2) {
      ScrollView {
        Row {
          ForEach(items.indices, id: \.self) { (index: Int) -> SettingChoiceCell in
            let model = items[index]
            return SettingChoiceCell(
              setting: setting,
              settingValue: model,
              isActive: model.title == activeItem.title,
              frameHeight: 56,
              showSeparator: true,
              onTap: onItemTap
            )
          }
        }
      }
    }
  }
}

// MARK: - Actions

private extension SettingsPickerPage {}

// MARK: - Responsive

private extension SettingsPickerPage {
  var contentMaxWidth: CGFloat {
    700
  }

  var listHorizontalPadding: CGFloat {
    sizeClass == .compact ? 20 : 60
  }

  var listVerticalPadding: CGFloat {
    sizeClass == .compact ? 10 : 20
  }

  var listItemSpacing: CGFloat {
    sizeClass == .compact ? 8 : 10
  }
}

// MARK: - Views

private extension SettingsPickerPage {}

// MARK: - Previews

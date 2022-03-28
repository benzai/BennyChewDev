import SwiftUI

extension SettingsPage {}

///
/// SettingsPage
///
struct SettingsPage: View {
  @Environment(\.horizontalSizeClass) private var sizeClass
  @Environment(\.presentationMode) private var presentationMode
  @Environment(\.colorScheme) private var colorScheme
  @EnvironmentObject private var settings: AppSettings
  @EnvironmentObject private var theme: AppTheme
  @EnvironmentObject private var router: AppRouter

  // State
//  @State private var settingPayload: Setting? {
//    didSet {
//      router.pushView(.settingsPicker(payload: settingPayload))
//    }
//  }

  // Init

  init() {}

  var body: some View {
    NavigationView {
      ScrollView {
        Row {
          navigationLinks()
          settingsList()
        }
        .frame(maxWidth: .infinity, alignment: .center)
      }
      .navigationBarTitle("Settings", displayMode: .inline)
    }
    .navigationViewStyle(.stack)

    .onAppear(perform: onAppear)
    .onDisappear(perform: onDisappear)
  }
}

// MARK: - Actions

private extension SettingsPage {
  func onAppear() {
    print("SettingsPage onAppear")
  }

  func onDisappear() {
    print("SettingsPage onDisappear")
  }

  func onItemTap(setting: Setting) {
    print("SettingsPage onItemTap")
    switch setting {
    case .language:
      UIApplication.openSettings()

    case .theme:
      print("theme")
      router.push(.settingsPicker_theme)

    case .currency:
      print("currency")
      router.push(.settingsPicker_currecy)

    case .aboutApp:
      print("aboutApp")
    }
  }

  func onSettingChoiceTap(setting: Setting, choice: ISettingChoice) {
    print("SettingsPage onSettingChoiceTap", setting, choice)
    switch setting {
    case .theme:
      let newValue = UserTheme(rawValue: choice.key) ?? AppSettings.Defaults.userTheme
      settings.changeUserTheme(to: newValue)

    case .currency:
      let newValue = Coin.Currency(rawValue: choice.key) ?? AppSettings.Defaults.currency
      settings.changeCurrency(to: newValue)

    default:
      break
    }
  }
}

// MARK: - Responsive

private extension SettingsPage {
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

private extension SettingsPage {
  func navigationLinks() -> some View {
    Group {
      NavigationLink(
        "",
        destination: AC.shared.settingsPickerPage_theme(
          activeItem: $settings.userTheme,
          handler: onSettingChoiceTap
        ),
        tag: .settingsPicker_theme,
        selection: $router.activePush
      )

      NavigationLink(
        "",
        destination: AC.shared.settingsPickerPage_currency(
          activeItem: $settings.currency,
          handler: onSettingChoiceTap
        ),
        tag: .settingsPicker_currecy,
        selection: $router.activePush
      )
    }
  }

//  func settingsPickerPage<T: ISettingChoice>(
//    setting: Setting,
//    activeItem: Binding<T>,
//    handler: @escaping (Setting, ISettingChoice) -> Void
//  ) -> some View {
//    switch setting {
//    case .theme:
//      return SettingsPickerPage<UserTheme>(
//        setting: setting,
//        activeItem: activeItem,
//        items: UserTheme.allCases,
//        onItemTap: handler
//      )
//      .eraseToAnyView()
//
//    case .currency:
//      return SettingsPickerPage<Coin.Currency>(
//        setting: setting,
//        activeItem: activeItem,
//        items: Coin.Currency.allCases,
//        onItemTap: handler
//      )
//      .eraseToAnyView()
//
//    default: return EmptyView().eraseToAnyView()
//    }
//  }

  func settingsList() -> some View {
    Row(spacing: 20) {
      preferencesSection()
      informationSection()
    }
    .padding(.horizontal, listHorizontalPadding)
    .padding(.vertical, listVerticalPadding)
    .frame(maxWidth: contentMaxWidth, alignment: .center)
  }

  func preferencesSection() -> some View {
    Row {
      sectionHeader(title: R.string.localizations.settings_section_preferences())

      Row {
        SettingOptionCell(
          setting: .language,
          type: .singleChoice,
          title: R.string.localizations.settings_setting_language(),
          value: R.string.localizations.locale(),
          frameHeight: 56,
          showSeparator: true,
          onTap: onItemTap
        )

        SettingOptionCell(
          setting: .theme,
          type: .singleChoice,
          title: R.string.localizations.settings_setting_theme(),
          value: settings.userTheme.title,
          frameHeight: 56,
          showSeparator: false,
          onTap: onItemTap
        )

        SettingOptionCell(
          setting: .currency,
          type: .singleChoice,
          title: R.string.localizations.settings_setting_currency(),
          value: settings.currency.title,
          frameHeight: 56,
          showSeparator: false,
          onTap: onItemTap
        )
      }
      .cornerRadius(8)
      .shadow(color: Color.black.opacity(0.08), radius: 3, x: 0, y: 1)
    }
  }

  func informationSection() -> some View {
    Row {
      sectionHeader(title: R.string.localizations.settings_section_information())

      Row {
        SettingOptionCell(
          setting: .aboutApp,
          type: .pageLink,
          title: R.string.localizations.settings_setting_aboutApp(),
          value: "",
          frameHeight: 56,
          showSeparator: true,
          onTap: onItemTap
        )
      }
      .cornerRadius(8)
      .shadow(color: Color.black.opacity(0.08), radius: 3, x: 0, y: 1)
    }
  }

  func sectionHeader(title: String) -> some View {
    Text(title.uppercased())
      .appFont(size: .sm, color: theme.colors.text3)
      .frame(maxHeight: .infinity, alignment: .leading)
      .frame(height: 36)
  }
}

// MARK: - Previews

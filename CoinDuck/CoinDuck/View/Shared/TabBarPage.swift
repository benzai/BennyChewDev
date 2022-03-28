import SwiftUI

struct TabBarPage: View {
  // State
  @State private var currentTabIndex = 0

  // Init
  init() {
    AppTheme.shared.setupSystemUI()
  }

  var body: some View {
    TabView(selection: $currentTabIndex) {
      ForEach(Tab.allCases) {
        tab(tab: $0)
      }
    }
//    .accentColor(.green)
  }
}

// MARK: - Actions

private extension TabBarPage {}

// MARK: - Views

private extension TabBarPage {
  func tab(tab: Tab) -> some View {
    tab.tabStyle.page
      .tabItem {
        Image(tab.tabStyle.icon)
          .renderingMode(.template)

        Text(tab.tabStyle.title)
      }
      .tag(tab.rawValue)
  }
}

// MARK: - // Previews

// struct RootScreen_Previews: PreviewProvider {
//  static var previews: some View {
//    TabBarPage()
//  }
// }

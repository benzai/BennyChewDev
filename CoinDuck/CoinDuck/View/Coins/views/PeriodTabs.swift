//import SwiftUI
//
//struct PeriodTabs: View {
//  @Environment(\.presentationMode) private var presentationMode
//  @Environment(\.colorScheme) private var colorScheme
//  @EnvironmentObject private var settings: AppSettings
//  @EnvironmentObject private var theme: AppTheme
//
//  typealias TabItem = Coin.Period
//  typealias OnTap = (TabItem) -> Void
//
//  // State
//  @State private var activeTabIndex: Int = 0
//
//  // Init
//  @Binding private var selectedTab: TabItem
//  private let items: [TabItem]
//  private let frameHeight: CGFloat
//  private let onTap: OnTap
//
//  init(
//    selectedTab: Binding<TabItem>,
//    items: [TabItem],
//    frameHeight: CGFloat = 32,
//    onTap: @escaping OnTap
//  ) {
//    self._selectedTab = selectedTab
//    self.items = items
//    self.frameHeight = frameHeight
//    self.onTap = onTap
//  }
//
//  var body: some View {
//    Column {
//      ForEach(items.indices) { (index: Int) in
//        let item = items[index]
//        if index == activeTabIndex {
//          Text(item.rawValue)
//            .appFont(context: theme, size: .md3, color: .accent1)
//            .padding(8)
//            .frame(height: frameHeight)
//            .background(theme.colors.accent1.opacity(0.2))
//            .cornerRadius(8)
//        } else {
//          Text(item.rawValue)
//            .appFont(context: theme, size: .md3, color: .text3)
//            .padding(8)
//            .frame(height: frameHeight)
//            .onTapGesture {
//              activeTabIndex = index
//              selectedTab = item
//              onTap(item)
//            }
//        }
//      }
//    }
//  }
//}

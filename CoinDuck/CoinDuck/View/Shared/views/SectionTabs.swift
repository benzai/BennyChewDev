//import SwiftUI
//
//struct SectionTabs: View {
//  @Environment(\.presentationMode) private var presentationMode
//  @Environment(\.colorScheme) private var colorScheme
//  @EnvironmentObject private var settings: AppSettings
//  @EnvironmentObject private var theme: AppTheme
//
//  typealias TabItem = String
//  typealias OnTap = (TabItem) -> Void
//
//  // State
//  @State private var activeTabIndex: Int = 0
//
//  // Init
//  @Binding private var selectedTab: Int
//  private let items: [TabItem]
//  private let onTap: OnTap
//
//  init(
//    selectedTab: Binding<Int>,
//    items: [TabItem],
//    onTap: @escaping OnTap
//  ) {
//    self._selectedTab = selectedTab
//    self.items = items
//    self.onTap = onTap
//  }
//
//  var body: some View {
//    ScrollView(.horizontal, showsIndicators: false) {
//      Column(spacing: 0) {
//        ForEach(items.indices) { (index: Int) in
//          let item = items[index]
//          if index == activeTabIndex {
//            Text(item)
//              .appFont(context: theme, size: .md3, color: .altText1)
//              .padding(10)
//              .frame(height: 36)
//              .background(theme.colors.accent1)
//              .cornerRadius(100)
//          } else {
//            Text(item)
//              .appFont(context: theme, size: .md3, color: .text3)
//              .padding(10)
//              .frame(height: 36)
//              .onTapGesture {
//                activeTabIndex = index
//                selectedTab = index
//                onTap(item)
//              }
//          }
//        }
//      }
//      .padding(.horizontal, 20)
//    }
//    .frame(maxWidth: .infinity, alignment: .leading)
//  }
//}

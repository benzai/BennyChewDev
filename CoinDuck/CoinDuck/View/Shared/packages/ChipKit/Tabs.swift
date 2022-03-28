//import SwiftUI
//
/////
///// Tabs
/////
//public struct Tabs: View {
//    @EnvironmentObject private var theme: AppTheme
//
//    public typealias OnTap = (Int) -> Void
//
//    @Binding private var activeIndex: Int
//    private let items: [TabItem]
//    private let baseColor: Color
//    private let padding: CGFloat
//    private let spacing: CGFloat
//    private let roundness: Roundness
//    private let onTap: OnTap
//
//    public init(
//        activeIndex: Binding<Int>,
//        items: [TabItem],
//        baseColor: Color,
//        padding: CGFloat = 10,
//        spacing: CGFloat = 6,
//        roundness: Roundness = .md,
//        onTap: @escaping OnTap
//    ) {
//        _activeIndex = activeIndex
//        self.items = items
//        self.baseColor = baseColor
//        self.padding = padding
//        self.spacing = spacing
//        self.roundness = roundness
//        self.onTap = onTap
//    }
//
//    public var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            Column(spacing: spacing) {
//                ForEach(items.indices) { (index: Int) in
//                    let item = items[index]
//                    if index == activeIndex {
//                        ClassicButton(
//                            item.title,
//                            frameColor: baseColor,
//                            textColor: .white,
//                            roundness: roundness
//                        ) {
//                            print("Already current active index.")
//                        }
//                        .disabled(true)
//                    } else {
//                        ClassicButton(
//                            item.title,
//                            frameColor: baseColor.opacity(0.1),
//                            textColor: baseColor,
//                            roundness: roundness
//                        ) {
//                            activeIndex = index
//                            onTap(index)
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                    }
//                }
//            }
//            .padding(padding)
//        }
//        .frame(maxWidth: .infinity, alignment: .leading)
//    }
//}
//
//public extension Tabs {
//    struct TabItem: Identifiable {
//        public let id: UUID = .init()
//        public let title: String
//
//        public init(title: String) {
//            self.title = title
//        }
//    }
//}

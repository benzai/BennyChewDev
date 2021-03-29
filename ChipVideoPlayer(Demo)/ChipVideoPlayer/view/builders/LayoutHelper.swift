import UIKit

///
/// LayoutHelper
///
struct LayoutHelper {
  static func makeCompositionalLayout(
    itemHeight: CGFloat = 80,
    itemsPerColumn: Int = 1,
    groupSpacing: CGFloat = 8,
    sectionSpacing: CGFloat = 8,
    containerPadding: CGFloat = 10
  ) -> UICollectionViewLayout {
    UICollectionViewCompositionalLayout(
      sectionProvider: { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
        // Item
        let itemSize = NSCollectionLayoutSize(
          widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
          heightDimension: NSCollectionLayoutDimension.absolute(itemHeight)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(
          top: 0,
          leading: 0,
          bottom: 0,
          trailing: 0
        )
        item.edgeSpacing = .init(leading: nil, top: nil, trailing: nil, bottom: .fixed(0))

        // Group
        let group = NSCollectionLayoutGroup.horizontal(
          layoutSize: itemSize,
          subitem: item,
          count: itemsPerColumn
        )
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(groupSpacing)

        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = sectionSpacing
        section.contentInsets = NSDirectionalEdgeInsets(
          top: containerPadding,
          leading: containerPadding,
          bottom: containerPadding,
          trailing: containerPadding
        )

        return section
      }
    )
  }
}

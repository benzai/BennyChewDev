import SDWebImageSwiftUI
import SwiftUI

///
/// CollectionCellView
/// - Used in the list view when you want to favorite/portfolio a Coin.
///
struct CollectionCellView: View {
  @EnvironmentObject private var settings: AppSettings
  @EnvironmentObject private var theme: AppTheme

  // Init
  typealias TapHandler = (UserCollection, UserCoin?) -> Void
  private let collection: UserCollection
  private let userCoin: UserCoin?
  private let onItemTap: TapHandler?
  private let onAccessoryTap: TapHandler?

  init(
    collection: UserCollection,
    userCoin: UserCoin?,
    onItemTap: TapHandler? = nil,
    onAccessoryTap: TapHandler? = nil
  ) {
    self.collection = collection
    self.userCoin = userCoin
    self.onItemTap = onItemTap
    self.onAccessoryTap = onAccessoryTap
  }

  var body: some View {
    Column(spacing: 8) {
      icon()
      titles()
      Spacer()
      accessory()
    }
    .padding(.leading, 10)
    .padding(.vertical, 10)
    .frame(maxWidth: .infinity, alignment: .leading)
    .frame(height: 60)
    .lineSeparator(color: .black, offset: 10)

    .onTapGesture {
      onItemTapAction()
    }
  }
}

// MARK: - Actions

private extension CollectionCellView {
  func onItemTapAction() {
    if let onItemTap = onItemTap {
      print("CollectionCellView onItemTapAction")
      onItemTap(collection, userCoin)
    }
  }

  func onAccessoryTapAction() {
    if let onAccessoryTap = onAccessoryTap {
      print("CollectionCellView onAccessoryTapAction")
      onAccessoryTap(collection, userCoin)
    }
  }
}

// MARK: - Views

private extension CollectionCellView {
  func icon() -> some View {
    ZStack {
      RoundedRectangle(cornerRadius: 12)
        .foregroundColor(theme.colors.text3.opacity(0.2))

      Image(R.image.icon_plus.name)
        .renderingMode(.template)
        .resizable()
        .frame(width: 24, height: 24)
        .foregroundColor(theme.colors.accent1)
    }
    .frame(width: 36, height: 36)
  }

  func titles() -> some View {
    Row(spacing: 4) {
      Text(collection.collectionTitle)
        .appFont(weight: .medium, size: .md3, color: theme.colors.text1, systemFont: true)

      Text(collection.collectionsCountString)
        .appFont(size: .sm, color: theme.colors.text3, systemFont: true)
    }
  }

  func accessory() -> some View {
    Row {
      IconButton(
        R.image.icon24Check.name,
        frameSize: .sm,
        frameColor: userCoin != nil ? theme.colors.accent1 : theme.colors.text3.opacity(0.2),
        iconSize: .sm,
        iconColor: userCoin != nil ? theme.colors.altText1 : .clear,
        onTap: onAccessoryTapAction
      )
      .padding(.trailing, 8)
    }
  }
}

// MARK: - Previews

// struct CollectionCellView_Previews: PreviewProvider {
//  static var previews: some View {
//    let item1 = CollectionCellView(
//      viewModel: UserCollectionViewModel(
//        collection: UserCollection.mockFavoriteCollection()
//      )
//    )
//
//    return Row {
//      item1
//    }
//    .environmentObject(AC.shared.settings)
//    .environmentObject(AC.shared.theme)
//
//    .previewLayout(.sizeThatFits)
//  }
// }

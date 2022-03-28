import SDWebImageSwiftUI
import SwiftUI

///
/// CoinCellView
///
struct CoinCellView<Model: ICoinViewModel>: View {
  @EnvironmentObject private var settings: AppSettings
  @EnvironmentObject private var theme: AppTheme

  // Init
  typealias TapHandler = (Model) -> Void
  private let model: Model
  private let onItemTap: TapHandler?
  private let onAccessoryTap: TapHandler?

  init(
    model: Model,
    onItemTap: TapHandler? = nil,
    onAccessoryTap: TapHandler? = nil
  ) {
    self.model = model
    self.onItemTap = onItemTap
    self.onAccessoryTap = onAccessoryTap
  }

  var body: some View {
    ZStack {
      Column {
        titlePane()
        Spacer()
        pricePane()
//        accessoryPane()
        actionsPane()
      }
      .padding(.leading, 10)
      .padding(.trailing, 4)
      .padding(.vertical, 10)
      .frame(maxWidth: .infinity, alignment: .leading)
      .frame(height: 60)
      .background(theme.colors.bg1)
    }
    .lineSeparator(color: .black, offset: 10)
//    .onTapGesture {
//      onItemTapAction()
//    }
  }
}

// MARK: - Actions

private extension CoinCellView {
  func onItemTapAction() {
    if let onItemTap = onItemTap {
      print("CoinCellView onItemTapAction")
      onItemTap(model)
    }
  }

  func onAccessoryTapAction() {
    if let onAccessoryTap = onAccessoryTap {
      print("CoinCellView onAccessoryTapAction")
      onAccessoryTap(model)
    }
  }
}

// MARK: - Responsive

private extension CoinCellView {
  var iconSize: CGFloat {
    24
  }
}

// MARK: - Views

private extension CoinCellView {
  func titlePane() -> some View {
    Column(spacing: 8) {
      icon()
      titles()
    }
  }

  func icon() -> some View {
    WebImage(url: model.iconUrl)
      .resizable()
      .placeholder {
        backupIcon()
      }
      .scaledToFit()
      .frame(width: iconSize, height: iconSize)
  }

  func backupIcon() -> some View {
    WebImage(url: model.backupIconUrl)
      .resizable()
      .placeholder {
        Circle()
          .foregroundColor(theme.colors.accent1.opacity(0.2))
      }
      .scaledToFit()
      .frame(width: iconSize, height: iconSize)
  }

  func titles() -> some View {
    Row(spacing: 6) {
      Text(model.name)
        .appFont(weight: .medium, size: .md3, color: theme.colors.text1, systemFont: true)

      Column(spacing: 2) {
        Text(model.symbol)
          .appFont(size: .sm2, color: theme.colors.text3, systemFont: true)

        Text("•")
          .appFont(size: .sm2, color: theme.colors.text3, systemFont: true)

        Text(model.rank)
          .appFont(size: .sm2, color: theme.colors.text3, systemFont: true)
      }

//      Text(model.dateUpdated)
//        .appFont(size: .sm2, color: theme.colors.text3, systemFont: true)
    }
  }

  func pricePane() -> some View {
    Row(alignment: .trailing, spacing: 6) {
      Column(spacing: 4) {
        Text(model.price.sign)
          .appFont(size: .sm2, color: theme.colors.text3, systemFont: true)

        Text(model.price.formatted)
          .appFont(weight: .medium, size: .md3, color: theme.colors.text1, systemFont: true)
      }

      if model.userPrefs.showSubPrice {
        subPrice()
      }
    }
  }

  func subPrice() -> some View {
    Column(spacing: 4) {
      Text(model.subPrice.sign)
        .appFont(size: .sm2, color: theme.colors.text3, systemFont: true)

      Text(model.subPrice.formatted)
        .appFont(size: .sm2, color: theme.colors.text3, systemFont: true)
    }
  }

//  func accessoryPane() -> some View {
//    let icon = model.isPriceIncrease ? R.image.glyph_caret_up.name : R.image.glyph_caret_down
//      .name
//    let color = model.isPriceIncrease ? theme.colors.statusPositive : theme.colors
//      .statusNegative
//    return HStack(spacing: 0) {
//      Spacer()
//      PercentageTag(value: model.changePct, icon: icon, color: color)
//    }
//    .frame(width: 70)
//  }

  func actionsPane() -> some View {
    IconButton(
      R.image.icon_more.name,
      frameSize: .sm,
      frameColor: .clear,
      iconSize: .md,
      iconColor: theme.colors.text3,
      onTap: onAccessoryTapAction
    )
  }
}

// MARK: - Previews

// struct CoinCellView_Previews: PreviewProvider {
//  static var previews: some View {
//    let item1 = CoinCellView(
//      viewModel: CoinViewModel(coin: Coin.mockCoin_bitcoin())
//    )
//    let item2 = CoinCellView(
//      viewModel: CoinViewModel(coin: Coin.mockCoin_ethereum())
//    )
//
//    return Row {
//      item1
//      item2
//    }
//    .environmentObject(AC.shared.settings)
//    .environmentObject(AC.shared.theme)
//
//    .previewLayout(.sizeThatFits)
//  }
// }

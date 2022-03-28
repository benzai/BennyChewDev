import SDWebImageSwiftUI
import SwiftUI

///
/// CoinDetailPage
///
struct CoinDetailPage<Model: ICoinViewModel>: View {
  @EnvironmentObject private var settings: AppSettings
  @EnvironmentObject private var theme: AppTheme
  @EnvironmentObject private var router: AppTheme

  // TODO: Change to ICoin later. It should also to be able to access the view model props.
//  typealias Model = ICoinViewModel
//  typealias Period = Model.Period

  // State
//  @State private var selectedPeriod: Period = AppSettings.shared.coinPeriod
//  @State private var selectedSection: Int = 0
  var tempTabs: [String] = ["Overview", "Exchanges", "News", "Calculator", "Links"]

  var model: Model
  @ObservedObject var coinsProvider: CoinsProvider
  @ObservedObject var favoritesProvider: FavoritesProvider
  @ObservedObject var portfolioProvider: PortfoliosProvider

  var body: some View {
    Row {
      content(item: model)
    }
//    PageScaffold(backgroundColor: theme.colors.bg1) {
//      switch coinsProvider.coinDetailLoading {
//      case .loading: loading()
//      case .done(let item): content(item: item)
//      case .failure: error()
//      default: EmptyView()
//      }
//    }
    .onAppear(perform: onAppear)
    .onDisappear(perform: onDisappear)
  }
}

// MARK: - Actions

private extension CoinDetailPage {
  func onAppear() {
    print("CoinDetailPage onAppear")
//    coinsProvider.fetchCoin(id: model.coinId, period: AppSettings.shared.coinPeriod)
  }

  func onDisappear() {
    print("CoinDetailPage onDisappear")
  }

  func moreButtonAction() {}

  func onPortfolioButton() {}

  func onFavoritesButton() {}

//  func periodTabAction(period: Period) {
//    print(period)
//  }

  func sectionTabAction(section: String) {}
}

// MARK: - Content Views

private extension CoinDetailPage {
  func content(item: Model) -> some View {
    ScrollView {
      Row {
        topBar(item)
        pricePane(item)
        graphPane(item)
        actionsPane()
        moreDetailsPane()
      }
      .frame(maxWidth: .infinity)
    }
  }
}

// MARK: - Top Bar Views

private extension CoinDetailPage {
  func topBar(_ item: Model) -> some View {
    Column {
      backButton(item)
      titleGroup(item)
//      period(item)
    }
    .padding(.horizontal, 8)
    .frame(maxWidth: .infinity)
    .frame(height: 40)
  }

  func backButton(_ item: Model) -> some View {
    Column {
      IconButton(
        R.image.icon_arrow_left.name,
        frameSize: .md,
        frameColor: .clear,
        iconSize: .xl,
        iconColor: theme.colors.accent1,
        onTap: nil
      )
      Spacer()
    }
    .frame(width: 100)
  }

  func titleGroup(_ item: Model) -> some View {
    Column(spacing: 6) {
      Spacer()
      icon(item)
      titles(item)
      Spacer()
    }
    .offset(x: -10, y: 0)
  }

  func icon(_ item: Model) -> some View {
    Row {
      WebImage(url: item.iconUrl)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frameSize(28)
    }
    .frameSize(28)
  }

  func titles(_ item: Model) -> some View {
    Row(spacing: 2) {
      Text(item.name)
        .appFont(size: .md2, color: theme.colors.text1)

      Text(item.symbol)
        .appFont(size: .sm, color: theme.colors.text3)
    }
  }

//  func period(_ item: Model) -> some View {
//    let icon = item.isPriceIncrease ? R.image.glyph_caret_up.name : R.image.glyph_caret_down
//      .name
//    let color = item.isPriceIncrease ? theme.colors.statusPositive : theme.colors
//      .statusNegative
//    return Column {
//      Spacer()
//      PercentageTag(value: item.changePct, icon: icon, color: color)
//    }
//    .frame(width: 100)
//  }
}

// MARK: - Price Pane Views

private extension CoinDetailPage {
  func pricePane(_ item: Model) -> some View {
    Row {
      price(item)
      VGap(4)
      subPrice(item)
    }
    .padding(.vertical, 10)
  }

  func price(_ item: Model) -> some View {
    Column(spacing: 4) {
      Spacer()
      Text(item.price.sign)
        .appFont(size: .md3, color: theme.colors.text1)

      Text(item.price.formatted)
        .appFont(size: .lg2, color: theme.colors.text1)
      Spacer()
    }
  }

  func subPrice(_ item: Model) -> some View {
    Column(spacing: 4) {
      Spacer()
      Text(item.subPrice.sign)
        .appFont(size: .md3, color: theme.colors.text1)

      Text(item.subPrice.formatted)
        .appFont(size: .md2, color: theme.colors.text1)
      Spacer()
    }
  }
}

// MARK: - Graph Pane Views

private extension CoinDetailPage {
  func graphPane(_ item: Model) -> some View {
    Row {
      lineChart(item)
      periodTabs()
    }
  }

  func lineChart(_ item: Model) -> some View {
    Row {
//      LineChart(dataEntries: item.lineChart, color: theme.colors.accent1)
    }
    .frame(maxWidth: .infinity)
    .frame(height: 200)
  }

  func periodTabs() -> some View {
    Column {
      Spacer()
//      PeriodTabs(selectedTab: $selectedPeriod, items: Period.allCases, onTap: periodTabAction)
      Spacer()
    }
    .padding(.vertical, 8)
  }
}

// MARK: - Actions Pane Views

private extension CoinDetailPage {
  func actionsPane() -> some View {
    Column(spacing: 6) {
      IconButton(
        R.image.icon_more.name,
        frameSize: .md,
        frameColor: theme.colors.text3.opacity(0.2),
        iconSize: .xl,
        iconColor: theme.colors.text3,
        onTap: moreButtonAction
      )
      ClassicButton(
        "Add to portfolio",
        size: .sm,
        frameColor: theme.colors.accent2.opacity(0.2),
        textColor: theme.colors.accent2,
        flexible: true,
        systemFont: true,
        onTap: onPortfolioButton
      )
      ClassicButton(
        "Add to favorites",
        size: .sm,
        frameColor: theme.colors.accent2.opacity(0.2),
        textColor: theme.colors.accent2,
        flexible: true,
        onTap: onFavoritesButton
      )
    }
    .padding(10)
  }
}

// MARK: - More Details Pane Views

private extension CoinDetailPage {
  func moreDetailsPane() -> some View {
    Row(spacing: 10) {
//      sectionTabs()
      statsSection()
      statsSection()
      statsSection()
      statsSection()
    }
  }

//  func sectionTabs() -> some View {
//    SectionTabs(selectedTab: $selectedSection, items: tempTabs, onTap: sectionTabAction)
//      .padding(.vertical, 8)
//  }

  func statsSection() -> some View {
    Row {
      SectionHeader(
        title: "Stats", accessoryIcon: R.image.icon_more.name
      )
      Row(spacing: 6) {
        statListItem(
          icon: R.image.icon_marketcap.name,
          label: "Market Cap",
          value: "\(model.price.formatted)",
          color: theme.colors.accent1
        )
        statListItem(
          icon: R.image.icon_supply.name,
          label: "Circulating supply",
          value: "\(model.price.formatted)",
          color: theme.colors.accent1
        )
        statListItem(
          icon: R.image.icon_volume.name,
          label: "Daily volume",
          value: "\(model.price.formatted)",
          color: theme.colors.accent1
        )
      }
    }
    .padding(.horizontal, 20)
  }

  func statListItem(icon: String, label: String, value: String, color: Color) -> some View {
    Column(spacing: 10) {
      IconButton(icon, frameSize: .sm, frameColor: color, iconSize: .md, iconColor: .white, onTap: nil)
      Row {
        Row(spacing: 4) {
          Text(label.uppercased())
            .appFont(size: .sm2, color: theme.colors.text3, systemFont: true)

          Text(value)
            .appFont(size: .md3, color: theme.colors.text1, systemFont: true)
        }
      }
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 12)
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(theme.colors.text3.opacity(0.1))
    .cornerRadius(8)
  }
}

// MARK: - Helper Views

private extension CoinDetailPage {
  func loading() -> some View {
    Row(alignment: .center) {
//      ActivityIndicator(style: .medium)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
  }

  func error() -> some View {
    Row(alignment: .center) {
      Image(R.image.logoColor.name)
        .resizable()
        .renderingMode(.template)
        .foregroundColor(theme.colors.text3)
        .frameSize(64)

      VGap(10)

      Text("Error")
        .padding(.horizontal, 40)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
  }
}

// MARK: - Previews

//struct CoinDetailPage_Previews: PreviewProvider {
//  static var previews: some View {
//    let coinsProvider = AC.shared.coinsProvider
////    coinsProvider.coinDetailLoading = .done(Coin.mockCoin())
////    coinsProvider.coinDetail = Coin.mockCoin()
//    let favoritesProvider = AC.shared.favoritesProvider
//    let portfolioProvider = AC.shared.portfolioProvider
//
//    return Group {
//      CoinDetailPage(
//        model: Coin.mockCoin_bitcoin(),
//        coinsProvider: coinsProvider,
//        favoritesProvider: favoritesProvider,
//        portfolioProvider: portfolioProvider
//      )
//      .previewLayout(.fixed(width: 375, height: 1500))
//
////      CoinDetailPage(
////        model: Coin.mockCoin_bitcoin(),
////        coinsProvider: coinsProvider,
////        favoritesProvider: favoritesProvider,
////        portfolioProvider: portfolioProvider
////      )
//    }
//    .environmentObject(AC.shared.settings)
//    .environmentObject(AC.shared.theme)
//  }
//}

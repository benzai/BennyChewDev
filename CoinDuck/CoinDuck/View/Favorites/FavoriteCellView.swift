import SwiftUI

///
/// FavoriteCellView
///
struct FavoriteCellView<Model: ICoinViewModel>: View {
  @EnvironmentObject private var settings: AppSettings
  @EnvironmentObject private var theme: AppTheme

  typealias TapHandler = (Model) -> Void

  // Init
  private let model: Model
  private let onItemTap: TapHandler?

  init(
    model: Model,
    onItemTap: TapHandler? = nil
  ) {
    self.model = model
    self.onItemTap = onItemTap
  }

  var body: some View {
    Column {
      Text(model.name)
      Spacer()
      Text(model.rank)
    }
    .padding(.horizontal, 10)
    .padding(.vertical, 10)
    .frame(maxWidth: .infinity, alignment: .leading)
    .frame(height: 56)
    .lineSeparator(color: theme.colors.line1)
  }
}

// MARK: - Actions

private extension FavoriteCellView {
  func onItemTapAction() {
    if let onItemTap = onItemTap {
      print("FavoriteCellView onItemTapAction")
    }
  }
}

// MARK: - Views

private extension FavoriteCellView {}

// MARK: - Previews

// struct FavoriteCellView_Previews: PreviewProvider {
//  static var previews: some View {
//    let item1 = FavoriteCellView(
//      viewModel: UserCoinViewModel(userCoin: UserCoin.mockUserCoin_bitcoin())
//    )
//    let item2 = FavoriteCellView(
//      viewModel: UserCoinViewModel(userCoin: UserCoin.mockUserCoin_ethereum())
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

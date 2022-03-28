import Foundation

struct CoinViewModel: ICoinViewModel {
  typealias Model = Coin
  let model: Model

  init(model: Model) {
    self.model = model
  }
}

extension CoinViewModel {
  var id: String {
    model.id
  }
}

struct UserCoinViewModel: ICoinViewModel {
  typealias Model = UserCoin
  let model: Model

  init(model: Model) {
    self.model = model
  }
}

extension UserCoinViewModel {
  var id: String {
    model.raw_coinId ?? ""
  }
}

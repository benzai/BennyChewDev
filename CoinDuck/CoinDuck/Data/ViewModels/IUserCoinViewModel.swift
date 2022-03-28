import Foundation

///
/// IUserCoinViewModel
///
protocol IUserCoinViewModel: Identifiable {
  var userCoin: UserCoin { get }

  var coinId: String { get }

  var id: UUID { get }
  var dateCreated: Date { get }
}

extension IUserCoinViewModel {
  var coinId: String {
    guard let coinId = userCoin.raw_coinId else {
      fatalError()
    }
    return coinId
  }

  var id: UUID {
    userCoin.raw_id ?? UUID()
  }

  var dateCreated: Date {
    userCoin.raw_dateCreated ?? Date()
  }
}

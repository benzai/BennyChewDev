import Foundation

///
/// IUserCollectionViewModel
///
protocol IUserCollectionViewModel: Identifiable {
  var collection: UserCollection { get }

  var collectionId: UUID { get }
  var collectionTitle: String { get }
  var userCoins: [UserCoin] { get }
  var coinIds: [String] { get }
  var collectionsCountString: String { get }
//  func containsItem(coinId: String) -> Bool
  func findUserCoin(coinId: String) -> UserCoin?
}

extension IUserCollectionViewModel {
  var collectionId: UUID {
    collection.raw_id ?? UUID()
  }

  var collectionTitle: String {
    collection.raw_title ?? ""
  }

  var collectionsCountString: String {
    let title = userCoins.count > 0 ? "items" : "item"
    return "\(userCoins.count) \(title)"
  }

  var userCoins: [UserCoin] {
    guard let set = collection.raw_userCoins else {
      return []
    }
    return Array(set).sorted {
      ($0.raw_dateCreated ?? Date()) < ($1.raw_dateCreated ?? Date())
    }
  }

  var coinIds: [String] {
    userCoins.compactMap(\.raw_coinId)
  }

//  func containsItem(coinId: String) -> Bool {
//    userCoins.contains { $0.raw_coinId == coinId }
//  }

  func findUserCoin(coinId: String) -> UserCoin? {
    userCoins.first(where: { $0.raw_coinId == coinId })
  }
}

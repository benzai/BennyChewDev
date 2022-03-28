import Combine
import CoreData

protocol UserCollectionProviderDelegate {
  associatedtype Storage: IUserCollectionDelegate

  // Dependencies
  var storage: Storage { get }
  var coinsAPIService: CoinsAPIService { get }

  // CRUD Actions
  func createSystemCollection() async
  func fetchCollections()
  func updatePageCoins(with collection: UserCollection) async
  func createCollection(title: String?)
  func addToCollection(coin: Coin, collection: UserCollection)
  func removeFromCollection(userCoin: UserCoin, collection: UserCollection)
}

// MARK: - CRUD Actions

extension UserCollectionProviderDelegate {
  func createSystemCollection() async {
    storage.createSystemCollection {
      return
    }
  }

  func fetchCollections() {
    storage.fetchCollections()
  }

  func updatePageCoins(with collection: UserCollection) async {
    do {
      let coins = try await coinsAPIService.getCoinsById(coinIds: collection.coinIds)
      dump(coins)

      for (idx, userCoin) in collection.userCoins.enumerated() {
        let coin = coins[idx]
        userCoin.raw_name = coin.raw_name
        userCoin.raw_symbol = coin.raw_symbol
        userCoin.raw_price = coin.raw_price
        userCoin.raw_change = coin.raw_change
      }
    } catch {
      print(error)
    }
  }

  func createCollection(title: String?) {
    if let title = title {
      _ = storage.createCollection(title: title, collectionType: .user)
    } else {
      let count = storage.count()
      let defaultTitle = "Collection \(count + 1)"
      _ = storage.createCollection(title: defaultTitle, collectionType: .user)
    }
  }

  func addToCollection(coin: Coin, collection: UserCollection) {
    storage.addToCollection(coin: coin, collection: collection)
  }

  func removeFromCollection(userCoin: UserCoin, collection: UserCollection) {
    storage.removeFromCollection(userCoin: userCoin, collection: collection)
  }
}

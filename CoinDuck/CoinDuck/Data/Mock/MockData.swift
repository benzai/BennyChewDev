//import CoreData
//
///// CoinProvider
//extension CoinsProvider {
//  static let context = AC.shared.coreDataService.viewContext
//
//  static func mockCoins() -> [Coin] {
//    [
//      Coin(uuid: "Qwsogvtv82FCd", name: "Bitcoin", symbol: "BTC", rank: 1, price: 50000),
//      Coin(uuid: "razxDUgYGNAdQ", name: "Ethereum", symbol: "ETH", rank: 2, price: 3500.50)
//    ]
//  }
//}
//
///// Coin
//extension Coin {
//  static let context = AC.shared.coreDataService.viewContext
//
//  static func mockCoin_bitcoin() -> Coin {
//    Coin(context: context, uuid: "Qwsogvtv82FCd", name: "Bitcoin", symbol: "BTC", rank: 1, price: 50000)
//  }
//
//  static func mockCoin_ethereum() -> Coin {
//    Coin(context: context, uuid: "razxDUgYGNAdQ", name: "Ethereum", symbol: "ETH", rank: 2, price: 3500.50)
//  }
//}
//
///// UserCoin
//extension UserCoin {
//  static let context = AC.shared.coreDataService.viewContext
//
//  static func mockUserCoin_bitcoin() -> UserCoin {
//    UserCoin(context: context, coin: Coin.mockCoin_bitcoin())
//  }
//
//  static func mockUserCoin_ethereum() -> UserCoin {
//    UserCoin(context: context, coin: Coin.mockCoin_ethereum())
//  }
//}
//
///// UserCollection
//extension UserCollection {
//  static let context = AC.shared.coreDataService.viewContext
//
//  static func mockFavoriteCollection() -> UserCollection {
//    UserCollection(context: context, title: "Favorites Collection", entityType: .favorites, collectionType: .user)
//  }
//
//  static func mockFavoriteCollections() -> [UserCollection] {
//    let userCoin1 = UserCoin(context: context, coin: Coin.mockCoin_bitcoin(), holding: nil)
//    let userCoin2 = UserCoin(context: context, coin: Coin.mockCoin_ethereum())
//    let collection1 = UserCollection(context: context, title: "Favorites Collection", entityType: .favorites, collectionType: .user)
//    collection1.addToCd_userCoins(userCoin1)
//    collection1.addToCd_userCoins(userCoin2)
//    return [
//      collection1,
//      UserCollection(context: context, title: "List 2", entityType: .favorites, collectionType: .user),
//      UserCollection(context: context, title: "List 3", entityType: .favorites, collectionType: .user),
//    ]
//  }
//}

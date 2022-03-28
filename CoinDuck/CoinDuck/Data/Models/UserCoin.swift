import CoreData

///
/// UserCoin
///
@objc(UserCoin)
class UserCoin: NSManagedObject, ICoin, Identifiable {
  static let entityName = "UserCoin"

  @NSManaged var raw_coinId: String?
  @NSManaged var raw_collectionId: UUID?

  @NSManaged var raw_id: UUID?
  @NSManaged var raw_dateCreated: Date?

  @NSManaged var raw_partOfCollections: Set<UserCollection>?

  var raw_name: String?
  var raw_symbol: String?

  var raw_rank: Int?
  var raw_price: Double?
  var raw_change: Double?
  var raw_sparkline: [Double]?

  var raw_iconUrl: URL? = nil
  var raw_color: String? = nil

  var raw_detail: Coin.Detail? = nil

  convenience init(
    context: NSManagedObjectContext,
    coinId: String,
    collectionId: UUID
  ) {
    let entity = NSEntityDescription.entity(forEntityName: Self.entityName, in: context)!
    self.init(entity: entity, insertInto: context)

    self.raw_coinId = coinId
    self.raw_collectionId = collectionId

    self.raw_id = UUID()
    self.raw_dateCreated = Date()
  }
}

// MARK: - Helpers

extension UserCoin {
  @nonobjc class func fetchRequest() -> NSFetchRequest<UserCoin> {
    NSFetchRequest<UserCoin>(entityName: UserCoin.entityName)
  }

  static func findOrInsert(by id: String, context: NSManagedObjectContext) -> UserCoin {
    let request = UserCoin.fetchRequest()
    request.predicate = NSPredicate(format: "%K == %@", #keyPath(UserCoin.raw_coinId), id)
    if let item = try? context.fetch(request).first {
      return item
    } else {
      let item = UserCoin(context: context)
      return item
    }
  }
}

// MARK: - Config

extension UserCoin {
  enum Sort: String, CaseIterable {
    case dateCreated

    var ascending: Bool {
      switch self {
      case .dateCreated: return true
      }
    }
  }

  static func sortDescriptor(sort: Sort, ascending: Bool) -> NSSortDescriptor {
    switch sort {
    case .dateCreated:
      return NSSortDescriptor(keyPath: \UserCoin.raw_dateCreated, ascending: ascending)
    }
  }
}

// MARK: - View Model

//extension UserCoin: ICoinViewModel {
//  var coin: ICoin {
//    self
//  }
//
////  var coin: UserCoin {
////    self
////  }
//}

// extension UserCoin: IUserCoinViewModel {
//  var userCoin: UserCoin {
//    self
//  }
// }

import CoreData

///
/// UserCollection
///
@objc(UserCollection)
class UserCollection: NSManagedObject, Identifiable {
  static let entityName = "UserCollection"

  @NSManaged var raw_id: UUID?
  @NSManaged var raw_dateCreated: Date?

  @NSManaged var raw_title: String?
  @NSManaged var raw_entityTypeValue: String?
  @NSManaged var raw_collectionTypeValue: Int

  @NSManaged var raw_userCoins: Set<UserCoin>?

  convenience init(
    context: NSManagedObjectContext,
    title: String,
    entityType: EntityType,
    collectionType: CollectionType = .user
  ) {
    let entity = NSEntityDescription.entity(forEntityName: Self.entityName, in: context)!
    self.init(entity: entity, insertInto: context)

    self.raw_id = UUID()
    self.raw_dateCreated = Date()

    self.raw_title = title
    self.raw_entityTypeValue = entityType.rawValue
    self.raw_collectionTypeValue = collectionType.rawValue
  }
}

// MARK: - Helpers

extension UserCollection {
  @nonobjc class func fetchRequest() -> NSFetchRequest<UserCollection> {
    NSFetchRequest<UserCollection>(entityName: UserCollection.entityName)
  }
}

// MARK: - Related

extension UserCollection {
  @objc(addRaw_userCoinsObject:)
  @NSManaged func addToRaw_userCoins(_ value: UserCoin)

  @objc(removeRaw_userCoinsObject:)
  @NSManaged func removeFromRaw_userCoins(_ value: UserCoin)

  @objc(addRaw_userCoins:)
  @NSManaged func addToRaw_userCoins(_ values: Set<UserCoin>)

  @objc(removeRaw_userCoins:)
  @NSManaged func removeFromRaw_userCoins(_ values: Set<UserCoin>)
}

// MARK: - Computed

extension UserCollection {
  var entityType: EntityType {
    get {
      EntityType(rawValue: raw_entityTypeValue ?? UserCollection.defaultEntityType) ?? .favorites
    }
    set {
      self.raw_entityTypeValue = newValue.rawValue
    }
  }

  var collectionType: CollectionType {
    get {
      CollectionType(rawValue: raw_collectionTypeValue) ?? .user
    }
    set {
      self.raw_collectionTypeValue = newValue.rawValue
    }
  }
}

// MARK: - Config

extension UserCollection {
  static let defaultEntityType = "favorites"

  enum EntityType: String {
    case favorites
    case portfolio
  }

  enum CollectionType: Int {
    case system = 0
    case user = 1
  }

  enum Sort: String, CaseIterable {
    case dateCreated

    var ascending: Bool {
      switch self {
      case .dateCreated: return true
      }
    }
  }

  static func sortDescriptor(sort: Sort, ascending: Bool = true) -> NSSortDescriptor {
    switch sort {
    case .dateCreated:
      return NSSortDescriptor(keyPath: \UserCollection.raw_dateCreated, ascending: ascending)
    }
  }
}

// MARK: - View Model

extension UserCollection: IUserCollectionViewModel {
  var collection: UserCollection {
    self
  }
}

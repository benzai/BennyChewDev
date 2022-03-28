//import Combine
//import SwiftUI
//import UIKit
//
//class CollectionListGroupCell: UICollectionViewCell {
//  static let reuseId = "CollectionListGroupCell"
//  typealias Model = UserCoin
//  typealias DataSource = UITableViewDiffableDataSource<Int, Model>
//  typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Model>
//
//  // Controllers
//  private var bag = Set<AnyCancellable>()
//  private lazy var dataSource = makeDataSource()
//
//  // State
//  var collection: UserCollection? {
//    didSet {
//      guard let collection = collection else {
//        return
//      }
//      applySnapshot(with: collection.userCoinsWrapped)
//    }
//  }
//
//  // Init
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    setupUI()
//    setupPublishers()
//  }
//
//  required init?(coder aDecoder: NSCoder) {
//    super.init(coder: aDecoder)
//  }
//
//  // Views
//  private lazy var tableView: UITableView = {
//    let node = UITableView(frame: .zero)
//    node.translatesAutoresizingMaskIntoConstraints = false
//    node.backgroundColor = .yellow
//    return node
//  }()
//}
//
//// MARK: - Setup
//
//private extension CollectionListGroupCell {
//  func setupUI() {
//    setupViews()
//  }
//
//  func setupViews() {
//    addSubview(tableView)
//    NSLayoutConstraint.activate([
//      tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
//      tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
//      tableView.topAnchor.constraint(equalTo: topAnchor),
//      tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
//    ])
//  }
//
//  func setupPublishers() {
//    tableView.register(UserCoinItemCell.self, forCellReuseIdentifier: UserCoinItemCell.reuseId)
//
////    tableView.delegate = self
//    tableView.dataSource = dataSource
//  }
//}
//
//// MARK: - DiffableDataSource
//
//private extension CollectionListGroupCell {
//  func makeDataSource() -> DataSource {
//    let dataSource = DataSource(tableView: tableView) { tableView, indexPath, model in
//      guard let cell = tableView.dequeueReusableCell(withIdentifier: UserCoinItemCell.reuseId, for: indexPath) as? UserCoinItemCell
//      else {
//        fatalError("Cell could not be dequeued.")
//      }
//      cell.selectionStyle = .none
//      cell.updateView(with: model)
//      return cell
//    }
//
//    return dataSource
//  }
//
//  func applySnapshot(with items: [UserCoin], animatingDifferences: Bool = false) {
//    if !items.isEmpty {
//      print("CollectionListGroupCell applySnapshot")
//      var snapshot = Snapshot()
//      snapshot.appendSections([0])
//      snapshot.appendItems(items)
//      dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
//    }
//  }
//}

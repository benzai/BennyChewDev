// import Combine
// import UIKit
//
// final class PortfoliosVC: UIViewController {
//  typealias DataSource = UITableViewDiffableDataSource<Int, UserCollection>
//  typealias Snapshot = NSDiffableDataSourceSnapshot<Int, UserCollection>
//  typealias Cell = ListItemCell
//
//  // Controllers
//  private var bag = Set<AnyCancellable>()
//
//  private lazy var dataSource = makeDataSource()
//
//  // State
//
//  // Init
//  private let portfolioProvider = AppContainer.shared.portfolioProvider
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    print("PortfoliosVC viewDidLoad")
//    setupUI()
//    setupPublishers()
//  }
//
//  // Views
//  private lazy var tableView: UITableView = {
//    let node = UITableView(frame: .zero)
//    node.translatesAutoresizingMaskIntoConstraints = false
////    node.backgroundColor = .white
//    return node
//  }()
// }
//
//// MARK: - Actions
//
// private extension PortfoliosVC {
//  @objc func onRightBarButtonTap(sender: UIBarButtonItem) {
//    print(sender)
//  }
// }
//
//// MARK: - Setup
//
// private extension PortfoliosVC {
//  func setupUI() {
//    setupNavBar()
//    setupViews()
//  }
//
//  func setupNavBar() {
//    navigationItem.title = "Watchlist"
//    navigationItem.rightBarButtonItems = [
//      UIBarButtonItem(title: "Tap", style: .plain, target: self, action: #selector(onRightBarButtonTap(sender:))),
//    ]
//  }
//
//  func setupViews() {
//    view.addSubview(tableView)
//    NSLayoutConstraint.activate([
//      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//      tableView.topAnchor.constraint(equalTo: view.topAnchor),
//      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//    ])
//  }
//
//  func setupPublishers() {
//    print("PortfoliosVC setupPublishers")
//
//    tableView.register(Cell.self, forCellReuseIdentifier: Cell.reuseId)
//
//    tableView.delegate = self
//    tableView.dataSource = dataSource
//
//    // Collections
//    portfolioProvider.$collections.sink { [unowned self] collections in
//      applySnapshot(with: collections)
//    }
//    .store(in: &bag)
//  }
// }
//
//// MARK: - DiffableDataSource
//
// private extension PortfoliosVC {
//  func makeDataSource() -> DataSource {
//    let dataSource = DataSource(tableView: tableView) { tableView, indexPath, model in
//      let cell = tableView.dequeueReusableCell(withIdentifier: Cell.reuseId, for: indexPath) as! Cell
//      cell.selectionStyle = .none
//      print(model.titleWrapped)
//      cell.updateView(with: model)
//      return cell
//    }
//
//    // Supplementary views
//
//    return dataSource
//  }
//
//  func applySnapshot(with collections: [UserCollection], animatingDifferences: Bool = false) {
//    if !collections.isEmpty {
//      print("PortfoliosVC applySnapshot")
//      var snapshot = Snapshot()
//      snapshot.appendSections([0])
//      snapshot.appendItems(collections)
//      dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
//    }
//  }
// }
//
//// MARK: - UITableViewDelegate
//
// extension PortfoliosVC: UITableViewDelegate {
//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    guard let model = dataSource.itemIdentifier(for: indexPath) else {
//      return
//    }
//    print(model.entityType)
//  }
//
//  func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {}
// }

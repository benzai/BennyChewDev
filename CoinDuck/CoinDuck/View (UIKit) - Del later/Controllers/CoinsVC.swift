//import Combine
//import UIKit
//
//final class CoinsVC: UIViewController {
//  typealias DataSource = UITableViewDiffableDataSource<Int, Coin>
//  typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Coin>
//
//  // Controllers
//  private var bag = Set<AnyCancellable>()
//
//  private lazy var dataSource = makeDataSource()
//
//  // State
//
//  // Init
//  private let coinProvider = AppContainer.shared.coinProvider
//  private let favoriteProvider = AppContainer.shared.favoriteProvider
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    print("CoinsVC viewDidLoad")
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
//}
//
//// MARK: - Actions
//
//private extension CoinsVC {
//  @objc func onRightBarButtonTap(sender: UIBarButtonItem) {
//    print(sender)
//    coinProvider.goToNextPage()
//  }
//
//  func onViewAction(model: Coin) {
//    Swift.debugPrint("View: \(model.nameWrapped)")
//  }
//
//  func onFavoriteAction(model: Coin) {
//    let nav = AC.shared.favoriteCollectionList(model: model)
//    present(nav, animated: true)
//  }
//
//  func onPortfolioAction(model: Coin) {
//    Swift.debugPrint("Portfolio: \(model.nameWrapped)")
//  }
//}
//
//// MARK: - Setup
//
//private extension CoinsVC {
//  func setupUI() {
//    setupNavBar()
//    setupViews()
//  }
//
//  func setupNavBar() {
//    navigationItem.title = "Hello"
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
//    print("CoinsVC setupPublishers")
//
//    tableView.register(CoinItemCell.self, forCellReuseIdentifier: CoinItemCell.reuseId)
//
//    tableView.delegate = self
//    tableView.dataSource = dataSource
//
//    coinProvider.$coins.sink { [unowned self] coins in
//      applySnapshot(with: coins)
//    }
//    .store(in: &bag)
//  }
//}
//
//// MARK: - DiffableDataSource
//
//private extension CoinsVC {
//  func makeDataSource() -> DataSource {
//    let dataSource = DataSource(tableView: tableView) { tableView, indexPath, model in
//      guard let cell = tableView.dequeueReusableCell(withIdentifier: CoinItemCell.reuseId, for: indexPath) as? CoinItemCell
//      else {
//        fatalError("Cell could not be dequeued.")
//      }
//      cell.selectionStyle = .none
//      cell.updateView(with: model)
//      return cell
//    }
//
//    // Supplementary views
//
//    return dataSource
//  }
//
//  func applySnapshot(with items: [Coin], animatingDifferences: Bool = false) {
//    if !items.isEmpty {
//      print("CoinsVC applySnapshot")
//      var snapshot = Snapshot()
//      snapshot.appendSections([0])
//      snapshot.appendItems(items)
//      dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
//    }
//  }
//}
//
//// MARK: - UITableViewDelegate
//
//extension CoinsVC: UITableViewDelegate {
//  func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath,
//                 point: CGPoint) -> UIContextMenuConfiguration?
//  {
//    guard let model = dataSource.itemIdentifier(for: indexPath) else {
//      return nil
//    }
//    return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { suggestedActions in
//      let coinImage = UIImage(named: R.image.icon_coin.name)?.withRenderingMode(.alwaysTemplate).withTintColor(.white)
//      let favoriteImage = UIImage(named: R.image.icon_favorite.name)?.withRenderingMode(.alwaysTemplate).withTintColor(.white)
//      let portfolioImage = UIImage(named: R.image.icon_portfolio.name)?.withRenderingMode(.alwaysTemplate).withTintColor(.white)
//
//      let viewAction = UIAction(title: "View", image: coinImage) { _ in
//        self.onViewAction(model: model)
//      }
//      let favoriteAction = UIAction(title: "Favorite", image: favoriteImage) { _ in
//        self.onFavoriteAction(model: model)
//      }
//      let portfolioAction = UIAction(title: "Portfolio", image: portfolioImage) { _ in
//        self.onPortfolioAction(model: model)
//      }
//      return UIMenu(
//        title: "\(model.nameWrapped) (\(model.symbolWrapped.uppercased()))",
//        children: [viewAction, favoriteAction, portfolioAction]
//      )
//    }
//  }
//
//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    guard let model = dataSource.itemIdentifier(for: indexPath) else { return }
//    onViewAction(model: model)
//  }
//}

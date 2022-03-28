//import Combine
//import UIKit
//
///// READ: https://stackoverflow.com/questions/59674538/uicollectionview-compositionallayout-not-calling-uiscrolldelegate
//
//final class FavoritesVC: UIViewController {
//  typealias DataSource = UICollectionViewDiffableDataSource<Int, UserCollection>
//  typealias Snapshot = NSDiffableDataSourceSnapshot<Int, UserCollection>
//  typealias GroupCell = CollectionListGroupCell
//
//  // Controllers
//  private var bag = Set<AnyCancellable>()
//
//  var activeIndexSubject = CurrentValueSubject<Int, Never>(0)
//
//  @Published var activeIndex = 0
//
//  private lazy var dataSource = makeDataSource()
//
//  // State
//
//  // Init
//  private let favoriteProvider = AppContainer.shared.favoriteProvider
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    print("FavoritesVC viewDidLoad")
//    setupUI()
//    setupPublishers()
//  }
//
//  override func viewDidAppear(_ animated: Bool) {
//    super.viewDidAppear(animated)
//    Task {
//      await favoriteProvider.fetch()
//    }
//  }
//
//  // Views
//  private lazy var collectionView: UICollectionView = {
//    let layout = makeLayout()
//    let item = UICollectionView(frame: .zero, collectionViewLayout: layout)
//    item.translatesAutoresizingMaskIntoConstraints = false
//    item.backgroundColor = .brown
//    return item
//  }()
//}
//
//// MARK: - Actions
//
//private extension FavoritesVC {
//  @objc func onRightBarButtonTap(sender: UIBarButtonItem) {
//    print(sender)
//  }
//}
//
//// MARK: - Setup
//
//private extension FavoritesVC {
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
//    view.addSubview(collectionView)
//    NSLayoutConstraint.activate([
//      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//      collectionView.topAnchor.constraint(equalTo: view.topAnchor),
//      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//    ])
//  }
//
//  func setupPublishers() {
//    print("FavoritesVC setupPublishers")
//
//    collectionView.register(GroupCell.self, forCellWithReuseIdentifier: GroupCell.reuseId)
//    collectionView.delegate = self
//    collectionView.dataSource = dataSource
//
////    // Collections
////    favoriteProvider.$collections.sink { [weak self] collections in
////      guard let self = self else {
////        print("KAKKKK")
////        return
////      }
////      self.applySnapshot(with: collections)
////    }
////    .store(in: &bag)
////
////    // Active index
////    $activeIndex.sink { index in
////      print(index)
////      guard let collection = self.dataSource.itemIdentifier(for: IndexPath(item: index, section: 0)) else {
////        print("NO COL YET")
////        return
////      }
////      self.navigationItem.title = collection.titleWrapped
////    }
////    .store(in: &bag)
//
//    // collections + activeIndex
//    Publishers.CombineLatest(favoriteProvider.$collections, $activeIndex)
//      .receive(on: DispatchQueue.main)
//      .sink { [unowned self] collections, activeIndex in
//        applySnapshot(with: collections)
//
//        if let activeCollection = dataSource.itemIdentifier(for: IndexPath(item: activeIndex, section: 0)) {
//          navigationItem.title = activeCollection.title ?? ""
//        }
//      }
//      .store(in: &bag)
//  }
//}
//
//// MARK: - UICollectionViewDelegate
//
//extension FavoritesVC: UICollectionViewDelegate {
//  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    print("didSelectItemAt \(indexPath.item)")
//    collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
//  }
//}
//
//extension FavoritesVC: UIScrollViewDelegate {
//  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//    print("ENDDD")
//  }
//}
//
//// MARK: - DiffableDataSource
//
//private extension FavoritesVC {
//  func makeLayout() -> UICollectionViewLayout {
//    let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnv -> NSCollectionLayoutSection? in
//      return self.cardsSection()
//    }
//
//    return layout
//  }
//
//  func cardsSection() -> NSCollectionLayoutSection {
//    let item =
//      NSCollectionLayoutItem(layoutSize:
//        NSCollectionLayoutSize(
//          widthDimension: .fractionalWidth(1),
//          heightDimension: .fractionalHeight(1)
//        ))
//
//    let group = NSCollectionLayoutGroup.horizontal(
//      layoutSize: NSCollectionLayoutSize(
//        widthDimension: .fractionalWidth(1),
//        heightDimension: .fractionalHeight(1)
//      ),
//      subitem: item,
//      count: 1
//    )
//    group.contentInsets = NSDirectionalEdgeInsets(
//      top: 0,
//      leading: 0,
//      bottom: 0,
//      trailing: 0
//    )
//
//    let section = NSCollectionLayoutSection(group: group)
//    section.orthogonalScrollingBehavior = .groupPagingCentered
//    section.contentInsets = NSDirectionalEdgeInsets(
//      top: 0,
//      leading: 0,
//      bottom: 0,
//      trailing: 0
//    )
//    section.interGroupSpacing = 0
//
//    section.visibleItemsInvalidationHandler = { [unowned self] visibleItems, point, environment in
//      guard let idx = visibleItems.last?.indexPath.row else {
//        return
//      }
//      if idx != activeIndexSubject.value {
////        self.activeIndexSubject.send(idx)
//        activeIndex = idx
//      }
//    }
//
//    return section
//  }
//
//  func makeDataSource() -> DataSource {
//    let dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, model in
//      guard let cell = collectionView.dequeueReusableCell(
//        withReuseIdentifier: CollectionListGroupCell.reuseId,
//        for: indexPath
//      ) as? CollectionListGroupCell
//      else {
//        fatalError("Cell could not be dequeued.")
//      }
//      cell.collection = model
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
//      print("FavoritesVC applySnapshot")
//      var snapshot = Snapshot()
//      snapshot.appendSections([0])
//      snapshot.appendItems(collections)
//      dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
//    }
//  }
//}

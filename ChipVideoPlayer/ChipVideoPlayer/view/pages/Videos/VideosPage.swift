import UIKit
import Combine
import SnapKit
import PanModal
import AVKit

///
/// VideosPage
///
class VideosPage: UIViewController {
  typealias Section = VideoSection
  typealias Entity = Video
  typealias ViewModel = VideosViewModel
  typealias DataSource = UICollectionViewDiffableDataSource<Section, Entity>
  typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Entity>

  private var subs = Set<AnyCancellable>()

  // Objects
  private lazy var dataSource = makeDataSource()
  private let videoController = AVPlayerViewController()

  // State

  // Init
  private let viewModel: ViewModel

  init(viewModel: ViewModel) {
    print("VideosPage init")
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  override func viewDidLoad() {
    print("VideosPage viewDidLoad")
    super.viewDidLoad()
    setNeedsStatusBarAppearanceUpdate()
    render()
    setupNavBar()
    setupDelegates()
    setupPublishers()
    viewModel.fetch()
  }

  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    collectionView.collectionViewLayout.invalidateLayout()
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    checkLayout()
  }

  // Views
  private lazy var collectionView = _collectionView()
  private lazy var blankMessage = _blankMessage()
  private lazy var errorMessage = _errorMessage()

  @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - UICollectionViewDelegate

extension VideosPage: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let item = dataSource.itemIdentifier(for: indexPath) else { return }
    presentVideoPlayer(itemData: item)
  }
}

// MARK: - UICollectionViewDiffableDataSource

private extension VideosPage {
  func makeDataSource() -> DataSource {
    let dataSource = DataSource(
      collectionView: collectionView,
      cellProvider: { collectionView, indexPath, itemData in
        let cell = collectionView.dequeueReusableCell(
          withReuseIdentifier: VideoListItemView.reuseId,
          for: indexPath
        ) as! VideoListItemView
        cell.itemData = itemData
        return cell
      }
    )

    return dataSource
  }

  func applySnapshot(with items: [Section]) {
    var snapshot = Snapshot()
    snapshot.appendSections(items)
    items.forEach { section in
      snapshot.appendItems(section.items, toSection: section)
    }
    dataSource.apply(snapshot, animatingDifferences: true)
  }
}

// MARK: - Actions

private extension VideosPage {
  func presentVideoPlayer(itemData: Entity) {
    if let videoUrl = itemData.demoVideo?.videoUrl {
      let player = AVPlayer(url: videoUrl)
      videoController.player = player

      present(videoController, animated: true) {
        player.play()
      }
    }
  }
}

// MARK: - Render

private extension VideosPage {
  func render() {
    view.addSubviews(collectionView, blankMessage, errorMessage)

    collectionView.snp.remakeConstraints {
      $0.edges.equalToSuperview()
    }
    blankMessage.snp.remakeConstraints {
      $0.center.equalToSuperview()
    }
    errorMessage.snp.remakeConstraints {
      $0.center.equalToSuperview()
    }

    blankMessage.isHidden = true
    errorMessage.isHidden = true
  }

  func renderMobile() {
    let layout = LayoutHelper.makeCompositionalLayout()
    collectionView.collectionViewLayout = layout
  }

  func renderTablet() {
    let layout = LayoutHelper.makeCompositionalLayout(
      itemHeight: 200,
      itemsPerColumn: 3,
      groupSpacing: 16,
      sectionSpacing: 16,
      containerPadding: 24
    )
    collectionView.collectionViewLayout = layout
  }

  func checkLayout() {
    switch traitCollection.horizontalSizeClass {
    case .compact:
      print("Compact")
      renderMobile()
    case .regular:
      print("Regular")
      renderTablet()
    default:
      print("Compact")
      renderMobile()
      break
    }
  }
}

// MARK: - Setup

private extension VideosPage {
  func setupNavBar() {
    navigationController?.navigationBar.prefersLargeTitles = true
  }

  func setupDelegates() {
    collectionView.register(
      VideoListItemView.self,
      forCellWithReuseIdentifier: VideoListItemView.reuseId
    )
    collectionView.dataSource = dataSource
    collectionView.delegate = self
  }

  func setupPublishers() {
    viewModel.$loadingState.sink { [weak self] state in
      switch state {
      case .loading:
        print("Loading")

      case .doneNothing:
        print("Nothing")
        self?.blankMessage.isHidden = false
        self?.errorMessage.isHidden = true

      case .done(let sections):
        print("Done")
        self?.blankMessage.isHidden = true
        self?.errorMessage.isHidden = true
        self?.applySnapshot(with: sections)

      case .failure(let error):
        print(error.localizedDescription)
        self?.blankMessage.isHidden = true
        self?.errorMessage.isHidden = false

      default: break
      }
    }
    .store(in: &subs)
  }
}

// MARK: - Views

private extension VideosPage {
  func _collectionView() -> UICollectionView {
    let layout = LayoutHelper.makeCompositionalLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = AT.ColorTint.bg2.uiColor
    return collectionView
  }

  func _blankMessage() -> UILabel {
    let label = AT.makeLabel(size: .lg, color: .accent1)
    label.text = "Nothing to display"
    return label
  }

  func _errorMessage() -> UILabel {
    let label = AT.makeLabel(size: .lg, color: .accent1)
    label.text = "ERROR!!"
    return label
  }
}

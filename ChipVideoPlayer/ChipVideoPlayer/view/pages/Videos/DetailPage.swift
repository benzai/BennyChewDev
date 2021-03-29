import UIKit
import Combine
import SnapKit
import PanModal
import AVKit

extension DetailPage: PanModalPresentable {
  var panScrollable: UIScrollView? {
    return scrollView
  }

  var longFormHeight: PanModalHeight {
    return .maxHeight
  }

  var topOffset: CGFloat {
    return 52
  }

  var cornerRadius: CGFloat {
    return 12
  }
}

///
/// DetailPage
///
class DetailPage: UIViewController {
  typealias Entity = Video
  typealias ViewModel = VideosViewModel

  private var subs = Set<AnyCancellable>()

  // Objects
//  private let videoController = AVPlayerViewController()

  // State

  // Init
  private let itemId: Int
  private let viewModel: ViewModel

  init(itemId: Int, viewModel: ViewModel) {
    print("DetailPage init")
    self.itemId = itemId
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  deinit {
    print("DetailPage dispose")
  }

  override func viewDidLoad() {
    print("DetailPage viewDidLoad")
    super.viewDidLoad()
    render()
    setupPublishers()
    viewModel.fetch(by: itemId)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    checkLayout()
  }

  // Views
  private lazy var scrollView = UIScrollView()
  private lazy var titleLabel = AT.makeLabel(size: .lg, color: .accent1)
  private lazy var videoView = _videoView()
  private lazy var stack = ChipUIKitBuilder.container(children: [titleLabel, videoView])

  // Boilerplate
  @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Update UI

private extension DetailPage {
  func updateUI(with itemData: Entity) {
    titleLabel.text = itemData.title

    if let videoUrl = itemData.demoVideo?.videoUrl {
      playVideo(url: videoUrl)

      let player = AVPlayer(url: videoUrl)
      videoView.player = player
      videoView.player?.play()
    }
  }
}

// MARK: - Render

private extension DetailPage {
  func render() {
    view.addSubviews(scrollView)
    scrollView.addSubviews(stack)

    scrollView.snp.remakeConstraints {
      $0.edges.equalToSuperview()
    }
    stack.snp.remakeConstraints {
      $0.top.equalToSuperview()
      $0.leading.trailing.equalTo(view)
    }
    videoView.snp.remakeConstraints {
      $0.height.equalTo(300)
    }

//    stack.backgroundColor = .brown
//    scrollView.backgroundColor = .yellow
    videoView.backgroundColor = .black
    view.backgroundColor = .gray
  }

  func renderMobile() {}

  func renderTablet() {}

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

private extension DetailPage {
  func setupPublishers() {
    viewModel.$detailLoadingState.sink { [weak self] state in
      switch state {
      case .loading:
        print("Loading")

      case .done(let video):
        print("Done")
        self?.updateUI(with: video)

      case .failure(let error):
        print(error.localizedDescription)

      default: break
      }
    }
    .store(in: &subs)
  }

  func playVideo(url: URL) {}
}

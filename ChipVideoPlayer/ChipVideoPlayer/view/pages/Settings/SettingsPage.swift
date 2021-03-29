import UIKit
import SnapKit
import SwiftUI
import Combine

///
/// SettingsPage
///
class SettingsPage: UIViewController {
  private var subs = Set<AnyCancellable>()

  // Objects

  // State

  // Init
  init() {
    super.init(nibName: nil, bundle: nil)
  }

  override func viewDidLoad() {
    print("SettingsPage viewDidLoad")
    super.viewDidLoad()
    render()
    setupPublishers()
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    checkLayout()
  }

  // Views
  private lazy var _pageView: UIView = {
    UIHostingController(rootView: PageView()).view
  }()

  @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Actions

private extension SettingsPage {
  func onTap(name: String) {
    print(name)
  }
}

// MARK: - Update UI

private extension SettingsPage {}

// MARK: - Render

private extension SettingsPage {
  func render() {
    view.addSubviews(_pageView)

    _pageView.snp.remakeConstraints {
      $0.edges.equalToSuperview()
    }
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

private extension SettingsPage {
  func setupPublishers() {}
}

// MARK: - Views

private extension SettingsPage {
  struct PageView: View {
    var body: some View {
      Text("SettingsPage")
      Text("This is SwiftUI.")
    }
  }
}

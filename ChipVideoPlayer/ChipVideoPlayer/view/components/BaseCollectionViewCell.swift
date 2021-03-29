import UIKit
import SnapKit

///
/// BaseCollectionViewCell
///
class BaseCollectionViewCell: UICollectionViewCell {
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    checkLayout()
  }

  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    checkLayout()
  }

  func setup() {}

  func renderMobile() {}

  func renderTablet() {}

  private func checkLayout() {
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

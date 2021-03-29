import UIKit

// UIViewController
public extension UIViewController {
  func addChildViewController(_ child: UIViewController) {
    addChild(child)
    view.addSubview(child.view)
    child.didMove(toParent: self)
  }

  func removeChildViewController() {
    willMove(toParent: nil)
    view.removeFromSuperview()
    removeFromParent()
  }
}

// UIView
public extension UIView {
  func addSubviews(_ views: UIView ...) {
    for view in views {
      addSubview(view)
    }
  }

  func roundness(_ radius: CGFloat) {
    layer.cornerRadius = radius
    clipsToBounds = true
  }
}

// UIStackView
public extension UIStackView {
  func addArrangedSubviews(_ views: UIView ...) {
    for view in views {
      addArrangedSubview(view)
    }
  }
}

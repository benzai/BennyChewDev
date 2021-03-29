import UIKit
import SnapKit

///
/// ChipUIKitBuilder
///
public struct ChipUIKitBuilder {
  // MARK: - Layout

  enum LayoutDirection {
    case horizontal, vertical
  }

  /// UIStackView Vertical
  static func column(
    spacing: CGFloat = 0,
    distribution: UIStackView.Distribution = .fill,
    children: [UIView]
  ) -> UIStackView {
    let stack = UIStackView(arrangedSubviews: children)
    stack.axis = .vertical
    stack.spacing = spacing
    stack.distribution = distribution
    return stack
  }

  /// UIStackView Horizontal
  static func row(
    spacing: CGFloat = 0,
    distribution: UIStackView.Distribution = .fill,
    children: [UIView]
  ) -> UIStackView {
    let stack = UIStackView(arrangedSubviews: children)
    stack.axis = .horizontal
    stack.spacing = spacing
    stack.distribution = distribution
    return stack
  }

  /// UIStackView with styling
  static func container(
    direction: LayoutDirection = .vertical,
    spacing: CGFloat = 0,
    distribution: UIStackView.Distribution = .fill,
    children: [UIView],
    color: UIColor = .gray,
    cornerRadius: CGFloat = 0,
    padding: [CGFloat] = [0, 0, 0, 0]
  ) -> UIView {
    let container = UIView()
    container.backgroundColor = color
    container.layer.cornerRadius = cornerRadius
    container.clipsToBounds = true

    let stack = UIStackView(arrangedSubviews: children)
    switch direction {
    case .horizontal:
      stack.axis = .horizontal
    case .vertical:
      stack.axis = .vertical
    }

    container.addSubview(stack)
    stack.snp.makeConstraints {
      $0.left.equalToSuperview().offset(padding[0])
      $0.right.equalToSuperview().offset(padding[1])
      $0.top.equalToSuperview().offset(padding[2])
      $0.bottom.equalToSuperview().offset(padding[3])
    }

    return container
  }

  /// Spacer
  static func spacer(
    debug: Bool = false,
    color: UIColor
  ) -> UIView {
    let view = UIView()
    view.backgroundColor = debug ? color : .clear
    return view
  }

  // MARK: - Blocks

  struct blocks {
    /// UIView
    static func view(
      backgroundColor: UIColor = .red,
      cornerRadius: CGFloat = 0
    ) -> UIView {
      let view = UIView()
      view.backgroundColor = backgroundColor
      view.layer.cornerRadius = cornerRadius
      view.clipsToBounds = true
      return view
    }
  }

  // MARK: - Typography

  struct type {
    /// UILabel
    static func text(
      text: String = "Label",
      weight: String = "",
      size: CGFloat = 20,
      textColor: UIColor = .blue
    ) -> UILabel {
      let label = UILabel()
      label.font = UIFont.systemFont(ofSize: size)
      label.text = text
      label.textColor = textColor
      return label
    }
  }
}

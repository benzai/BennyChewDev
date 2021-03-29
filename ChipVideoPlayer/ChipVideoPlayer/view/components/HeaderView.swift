//import UIKit
//
/////
///// HeaderView
/////
//class HeaderView: UICollectionReusableView {
//  static let reuseId = "Header"
//
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//    layout()
//    configure()
//  }
//
//  required init?(coder aDecoder: NSCoder) {
//    super.init(coder: aDecoder)
//    layout()
//    configure()
//  }
//
//  func updateData(with section: ShitSection) {
//    titleLabel.text = section.title
//  }
//
//  // MARK: - Views
//
//  private lazy var titleLabel: UILabel = {
//    let item = UILabel()
//    item.text = "Title"
//    item.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//    item.translatesAutoresizingMaskIntoConstraints = false
//    return item
//  }()
//}
//
//private extension HeaderView {
//  func layout() {
//    addSubview(titleLabel)
//    NSLayoutConstraint.activate([
//      titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
//      titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
//    ])
//  }
//
//  func configure() {
//    backgroundColor = .green
//  }
//}

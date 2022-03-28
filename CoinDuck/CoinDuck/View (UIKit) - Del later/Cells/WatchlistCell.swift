//import UIKit
//
//class WatchlistCell: UITableViewCell {
//  static let reuseId = "WatchlistCell"
//  typealias Model = UserCollection
//
//  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//    super.init(style: style, reuseIdentifier: reuseIdentifier)
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
//  func updateView(with model: Model) {
//    nameLabel.text = "\(model.title ?? "")"
//  }
//
//  // Views
//  private lazy var nameLabel: UILabel = {
//    let node = UILabel()
//    node.translatesAutoresizingMaskIntoConstraints = false
//    return node
//  }()
//}
//
//private extension WatchlistCell {
//  func layout() {
//    addSubview(nameLabel)
//
//    NSLayoutConstraint.activate([
//      nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//      nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
//    ])
//  }
//
//  func configure() {
////    let selected = UIView()
////    selected.backgroundColor = .clear
////    selectedBackgroundView = selected
//
//    backgroundColor = .white
//
//    nameLabel.textColor = .blue
//  }
//}

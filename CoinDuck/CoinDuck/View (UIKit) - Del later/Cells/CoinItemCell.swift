//import UIKit
//
//class CoinItemCell: UITableViewCell {
//  static let reuseId = "CoinItemCell"
//  typealias Model = Coin
//
//  // Init
//  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//    super.init(style: style, reuseIdentifier: reuseIdentifier)
//    setupUI()
//    configure()
//  }
//
//  required init?(coder aDecoder: NSCoder) {
//    super.init(coder: aDecoder)
//  }
//
//  func updateView(with model: Model) {
//    nameLabel.text = "\(model.rankWrapped) \(model.nameWrapped) \(model.priceWrapped)"
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
//// MARK: - Setup
//
//private extension CoinItemCell {
//  func setupUI() {
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
//    backgroundColor = .yellow
//
//    nameLabel.textColor = .blue
//  }
//}

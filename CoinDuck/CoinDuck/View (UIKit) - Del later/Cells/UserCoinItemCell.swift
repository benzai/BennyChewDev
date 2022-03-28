//import UIKit
//
//class UserCoinItemCell: UITableViewCell {
//  static let reuseId = "UserCoinItemCell"
//  typealias Model = UserCoin
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
//    nameLabel.text = "\(model.coinWrapped.nameWrapped) \(model.coinWrapped.priceWrapped)"
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
//private extension UserCoinItemCell {
//  func setupUI() {
//    addSubview(nameLabel)
//
//    NSLayoutConstraint.activate([
//      nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//      nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
//    ])
//  }
//
//  func setupViews() {}
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

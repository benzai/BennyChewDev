import UIKit
import SnapKit
import Kingfisher

///
/// VideoListItemDelegate
///
protocol VideoListItemDelegate: class {
  func didTap(item: Video)
}

///
/// VideoListItemView
///
class VideoListItemView: BaseCollectionViewCell {
  typealias Entity = Video
  static let reuseId = "VideoListItemView"

  // Delegate
  weak var delegate: VideoListItemDelegate?

  // Item Data
  var itemData: Entity? {
    didSet {
      guard let itemData = itemData else { return }
      print(itemData)
      updateData(with: itemData)
    }
  }

  // Setup
  override func setup() {
    // Add
    addSubviews(iconView, textStack)

    // Style
    backgroundColor = AC.shared.theme.colors.bg1.uiColor()
    layer.cornerRadius = 12
    clipsToBounds = true
  }

  // Layout
  override func renderMobile() {
    mainLabel.font = AT.makeFont(size: .md)
    iconView.roundness(20)
    iconView.snp.remakeConstraints {
      $0.size.equalTo(40)
      $0.leading.equalTo(snp.leading).offset(10)
      $0.centerY.equalTo(snp.centerY)
    }
    textStack.snp.remakeConstraints {
      $0.leading.equalTo(iconView.snp.trailing).offset(8)
      $0.trailing.equalTo(snp.trailing)
      $0.centerY.equalTo(snp.centerY)
    }
  }

  override func renderTablet() {
    mainLabel.font = AT.makeFont(size: .lg)
    iconView.roundness(30)
    iconView.snp.remakeConstraints {
      $0.leading.equalTo(snp.leading).offset(20)
      $0.size.equalTo(60)
      $0.top.equalTo(snp.top).offset(40)
    }
    textStack.snp.remakeConstraints {
      $0.top.equalTo(iconView.snp.bottom).offset(10)
      $0.leading.equalTo(snp.leading).offset(20)
      $0.trailing.equalTo(snp.trailing)
    }
  }

  // Views
  private var iconView = UIImageView()
  private var mainLabel = AT.makeLabel(size: .md, color: .text1)
  private var subLabel = AT.makeLabel(size: .sm, color: .text3)
  private lazy var textStack = ChipUIKitBuilder.column(
    children: [mainLabel, subLabel]
  )
}

extension VideoListItemView {}

extension VideoListItemView {
  func updateData(with model: Entity) {
    // TODO: Move data manipulation to item view model.
    mainLabel.text = model.title
    subLabel.text = model.subTitle.uppercased()
    if let imageUrl = model.previewImage?.imageUrl {
      iconView.kf.setImage(with: imageUrl)
    } else {
      iconView.image = UIImage(named: R.image.puang.name)
    }
  }
}

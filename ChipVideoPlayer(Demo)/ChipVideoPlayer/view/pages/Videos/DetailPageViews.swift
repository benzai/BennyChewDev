import UIKit
import SnapKit

// MARK: - Views

extension DetailPage {
  func makeCollectionView() -> UICollectionView {
    let layout = LayoutHelper.makeCompositionalLayout()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = .red
    return collectionView
  }

  func _videoView() -> VideoView {
    let videoView = VideoView()
    return videoView
  }
}

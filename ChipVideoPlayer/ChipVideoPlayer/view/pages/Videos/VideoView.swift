import UIKit
import AVFoundation

class VideoView: UIView {
  var player: AVPlayer? {
    get {
      return playerLayer.player
    }
    set {
      playerLayer.player = newValue
    }
  }

  override class var layerClass: AnyClass {
    return AVPlayerLayer.self
  }

  var playerLayer: AVPlayerLayer {
    return layer as! AVPlayerLayer
  }
}

import SwiftUI

extension IconButton {
  enum InputSize {
    case xs
    case sm
    case md
    case lg
    case xl
    case custom(CGFloat)

    var value: CGFloat {
      switch self {
      case .xs: return 28
      case .sm: return 32
      case .md: return 40
      case .lg: return 48
      case .xl: return 56
      case .custom(let size): return size
      }
    }
  }

  enum IconSize {
    case xs
    case sm
    case md
    case lg
    case xl
    case custom(CGFloat)

    var value: CGFloat {
      switch self {
      case .xs: return 16
      case .sm: return 20
      case .md: return 24
      case .lg: return 28
      case .xl: return 32
      case .custom(let size): return size
      }
    }
  }
}

///
/// IconButton
///
struct IconButton: View {
  typealias OnTap = () -> Void
  private let iconImage: String
  private let isSystemImage: Bool
  private let frameSize: InputSize
  private let frameColor: Color
  private let iconSize: IconSize
  private let iconColor: Color
  private let onTap: OnTap?

  init(
    _ iconImage: String,
    isSystemImage: Bool = false,
    frameSize: InputSize = .md,
    frameColor: Color = .black,
    iconSize: IconSize = .md,
    iconColor: Color = .white,
    onTap: OnTap? = nil
  ) {
    self.iconImage = iconImage
    self.isSystemImage = isSystemImage
    self.frameSize = frameSize
    self.frameColor = frameColor
    self.iconSize = iconSize
    self.iconColor = iconColor
    self.onTap = onTap
  }

  var body: some View {
    let image = isSystemImage ? Image(systemName: iconImage) : Image(iconImage)

    return Column {
      image
        .resizable()
        .renderingMode(.template)
        .frame(width: iconSize.value, height: iconSize.value)
        .foregroundColor(iconColor)
    }
    .frame(width: frameSize.value, height: frameSize.value)
    .background(frameColor)
    .clipShape(Circle())
    .onTapGesture {
      if let onTap = onTap {
        onTap()
      }
    }
  }
}

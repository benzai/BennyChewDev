//import SwiftUI
//
/////
///// IconFrame
/////
//public struct IconFrame: View {
//  @EnvironmentObject private var theme: AppTheme
//
//  private let iconImage: String
//  private let frameSize: InputSize
//  private let frameColor: Color
//  private let iconSize: IconSize
//  private let iconColor: Color
//
//  public init(
//    _ iconImage: String,
//    frameSize: InputSize = .md,
//    frameColor: Color = .black,
//    iconSize: IconSize = .md,
//    iconColor: Color = .white
//  ) {
//    self.iconImage = iconImage
//    self.frameSize = frameSize
//    self.frameColor = frameColor
//    self.iconSize = iconSize
//    self.iconColor = iconColor
//  }
//
//  public var body: some View {
//    let _frameSize = AppThemeBuilder.inputSize(context: theme, size: frameSize)
//    let _iconSize = AppThemeBuilder.iconSize(context: theme, size: iconSize)
//
//    return Column {
//      Image(iconImage)
//        .resizable()
//        .renderingMode(.template)
//        .frameSize(_iconSize)
//        .foregroundColor(iconColor)
//    }
//    .frameSize(_frameSize)
//    .background(frameColor)
//    .clipShape(Circle())
//  }
//}

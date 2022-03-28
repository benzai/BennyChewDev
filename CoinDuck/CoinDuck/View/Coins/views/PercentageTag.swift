//import SwiftUI
//
//struct PercentageTag: View {
//  @EnvironmentObject private var theme: AppTheme
//
//  let iconSize: CGFloat = 16
//  let value: String
//  let icon: String
//  let color: Color
//
//  var body: some View {
//    HStack(spacing: 0) {
//      Image(icon)
//        .renderingMode(.template)
//        .resizable()
//        .frame(width: iconSize, height: iconSize)
//        .foregroundColor(color)
//
//      Text(value)
//        .appFont(context: theme, size: .md3, color: .custom(color))
//    }
//    .padding(.vertical, 4)
//    .padding(.trailing, 4)
//    .background(color.opacity(0.2))
//    .cornerRadius(6)
//  }
//}
//
//struct PercentageTag_Previews: PreviewProvider {
//  static var previews: some View {
//    PercentageTag(value: "0.2525%", icon: R.image.glyph_caret_up.name, color: .green)
//      .environmentObject(AC.shared.settings)
//      .environmentObject(AC.shared.theme)
//  }
//}

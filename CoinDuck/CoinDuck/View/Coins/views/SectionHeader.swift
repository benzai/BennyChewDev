import SwiftUI

extension SectionHeader {
  struct Padding {
    let leading: CGFloat
    let trailing: CGFloat
  }
}

struct SectionHeader: View {
  @EnvironmentObject private var theme: AppTheme

  private let title: String
  private let titleColor: Color
  private let accessoryIcon: String
  private let accessoryIconColor: Color
  private let padding: Padding
  //  @Binding var isExpanded: Bool

  init(
    title: String,
    titleColor: Color = .black,
    accessoryIcon: String,
    accessoryIconColor: Color = .black,
    padding: Padding = Padding(leading: 0, trailing: 0)
  ) {
    self.title = title
    self.titleColor = titleColor
    self.accessoryIcon = accessoryIcon
    self.accessoryIconColor = accessoryIconColor
    self.padding = padding
  }

  var body: some View {
    Column {
      Text(title)
        .appFont(weight: .medium, size: .md2, color: titleColor, systemFont: true)

      Spacer()

      Row {
        Image(accessoryIcon)
          .resizable()
          .frameSize(24)
          .foregroundColor(accessoryIconColor)
      }
      .frameSize(40)
    }
    .padding(.leading, padding.leading)
    .padding(.trailing, padding.trailing)
    .frame(height: 48)
  }
}

struct SectionHeader_Previews: PreviewProvider {
  static var previews: some View {
    SectionHeader(title: "Section", accessoryIcon: R.image.icon_more.name)
      .environmentObject(AC.shared.settings)
      .environmentObject(AC.shared.theme)
  }
}

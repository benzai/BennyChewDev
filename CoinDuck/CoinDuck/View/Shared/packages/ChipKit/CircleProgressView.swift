//import SwiftUI
//
//struct CircleProgressView: View {
//  @Binding var progress: Float
//
//  var lineWidth: CGFloat = 10
//  var baseColor: Color = Color.black.opacity(0.2)
//  var progressColor: Color = Color.red
//
//  var body: some View {
//    let padding = lineWidth / 2
//    return ZStack {
//      Circle()
//        .stroke(lineWidth: lineWidth)
//        .foregroundColor(baseColor)
//        .padding(padding)
//
//      Circle()
//        .trim(from: 0, to: CGFloat(min(progress, 1)))
//        .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
//        .rotationEffect(Angle(degrees: 270))
//        .foregroundColor(progressColor)
//        .padding(padding)
//        .animation(.linear)
//    }
//  }
//}

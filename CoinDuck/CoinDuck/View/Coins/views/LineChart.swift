//import Charts
//import SwiftUI
//
///// Charts framework UIViewRepresentable.
//struct LineChart: UIViewRepresentable {
//  let dataEntries: [ChartDataEntry]
//  let color: Color
//  let lineWidth: CGFloat = 2
//
//  func makeUIView(context: Context) -> LineChartUIKit {
//    LineChartUIKit(enableInteraction: false, color: color, lineWidth: lineWidth)
//  }
//
//  func updateUIView(_ view: LineChartUIKit, context: Context) {
//    view.dataEntries = dataEntries
//  }
//
//  // UIKit
//  class LineChartUIKit: UIView {
//    private let chartView = LineChartView()
//
//    var dataEntries: [ChartDataEntry] = [] {
//      didSet {
//        updateUI()
//      }
//    }
//
//    private let enableInteraction: Bool
//    private let color: Color
//    private let lineWidth: CGFloat
//
//    init(enableInteraction: Bool = true, color: Color, lineWidth: CGFloat = 2) {
//      self.enableInteraction = enableInteraction
//      self.color = color
//      self.lineWidth = lineWidth
//      super.init(frame: .zero)
//      render()
//    }
//
//    @available(*, unavailable)
//    required init?(coder aDecoder: NSCoder) {
//      fatalError("init(coder:) has not been implemented")
//    }
//
//    private func updateUI() {
//      let dataSet = LineChartDataSet(entries: dataEntries)
//      configureDataSet(dataSet: dataSet)
//      let data = LineChartData(dataSet: dataSet)
//      chartView.data = data
//    }
//
//    private func render() {
//      // Add
//      addSubview(chartView)
//
//      // Layout
//      chartView.translatesAutoresizingMaskIntoConstraints = false
//      NSLayoutConstraint.activate([
//        chartView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//        chartView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
//        chartView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
//        chartView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
//      ])
//
//      // Config
//      chartView.isUserInteractionEnabled = enableInteraction ? true : false
//      chartView.minOffset = 0
//      chartView.extraTopOffset = 0
//      chartView.chartDescription?.enabled = false
//      chartView.leftAxis.enabled = false
//      chartView.rightAxis.enabled = false
//      chartView.xAxis.enabled = false
//      chartView.legend.enabled = false
//    }
//
//    private func configureDataSet(dataSet: LineChartDataSet) {
//      // Display
//      dataSet.drawCirclesEnabled = false
//      dataSet.drawValuesEnabled = false
//      // Line
//      dataSet.lineWidth = lineWidth
//      dataSet.colors = [NSUIColor(color)]
//      // Fill
//      dataSet.drawFilledEnabled = true
//      dataSet.fillColor = NSUIColor(color)
//      dataSet.fillAlpha = 0.2
//      // Highlight
//      dataSet.highlightEnabled = true
//      dataSet.drawHorizontalHighlightIndicatorEnabled = false
//      dataSet.highlightLineWidth = lineWidth
//      dataSet.highlightColor = NSUIColor.blue
//    }
//  }
//}

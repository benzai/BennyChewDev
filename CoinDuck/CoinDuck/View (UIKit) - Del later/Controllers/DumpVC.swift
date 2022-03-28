//import SwiftUI
//import UIKit
//
//struct Shit: Identifiable {
//  let id = UUID()
//  let index: Int
//  let name: String
//  let color: UIColor
//}
//
//struct DumpView: UIViewControllerRepresentable {
//  typealias UIViewControllerType = DumpVC
//
//  @Binding var items: [Shit]
//
//  func makeUIViewController(context: Context) -> DumpVC {
//    DumpVC(items: items)
//  }
//
//  func updateUIViewController(_ uiViewController: DumpVC, context: Context) {
//    print("updateUIViewController")
//    uiViewController.updateItems(with: items)
//  }
//}
//
//class DumpVC: UIViewController {
//  var activePage: Int = 0 {
//    didSet {
//      print("activePage", activePage)
//    }
//  }
//
//  private var items: [Shit] {
//    didSet {
//      print(items.count)
//    }
//  }
//
//  func updateItems(with items: [Shit]) {
//    self.items = items
//    let item = items[activePage]
//    let vc = BoxVC(item: item)
//    pageController.setViewControllers([vc], direction: .forward, animated: false, completion: nil)
//  }
//
//  init(items: [Shit]) {
//    self.items = items
//    super.init(nibName: nil, bundle: nil)
//  }
//
//  @available(*, unavailable)
//  required init?(coder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//
//  func indexOf(with item: Shit) -> Int? {
//    guard let index = items.firstIndex(where: { $0.id == item.id }) else {
//      return nil
//    }
//    return index
//  }
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//
//    addChild(pageController)
//    view.addSubview(pageController.view)
//
//    pageController.view.snp.remakeConstraints {
//      $0.edges.equalToSuperview()
//    }
//
//    guard let item = items.first else { return }
//    let initialVC = BoxVC(item: item)
//    pageController.setViewControllers([initialVC], direction: .forward, animated: true, completion: nil)
//
//    pageController.delegate = self
//    pageController.dataSource = self
//    pageController.didMove(toParent: self)
//  }
//
//  // Views
//  private lazy var pageController: UIPageViewController = {
//    let node = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
//    return node
//  }()
//}
//
//extension DumpVC: UIPageViewControllerDelegate {
//  func pageViewController(
//    _ pageViewController: UIPageViewController,
//    didFinishAnimating finished: Bool,
//    previousViewControllers: [UIViewController],
//    transitionCompleted completed: Bool
//  ) {
//    guard completed,
//          let currentVC = pageViewController.viewControllers?.first as? BoxVC
//    else {
//      return
//    }
//
//    print(currentVC.item)
//    if let index = indexOf(with: currentVC.item) {
//      activePage = index
//    }
//    print(index)
//  }
//}
//
//extension DumpVC: UIPageViewControllerDataSource {
//  enum Direction {
//    case next, back
//  }
//
//  func pageViewController(
//    _ pageViewController: UIPageViewController,
//    viewControllerBefore viewController: UIViewController
//  ) -> UIViewController? {
//    guard let vc = preloadVC(direction: .back, currentVC: viewController) else {
//      return nil
//    }
//    return vc
//  }
//
//  func pageViewController(
//    _ pageViewController: UIPageViewController,
//    viewControllerAfter viewController: UIViewController
//  ) -> UIViewController? {
//    guard let vc = preloadVC(direction: .next, currentVC: viewController) else {
//      return nil
//    }
//    return vc
//  }
//
//  func preloadVC(direction: Direction, currentVC: UIViewController) -> BoxVC? {
//    guard let currentVC = currentVC as? BoxVC,
//          let currentIndex = indexOf(with: currentVC.item)
//    else {
//      return nil
//    }
//
//    var index = currentIndex
//
//    switch direction {
//    case .next:
//      index += 1
//    case .back:
//      index -= 1
//    }
//
//    guard index >= 0, index < items.count else {
//      return nil
//    }
//
//    let item = items[index]
//    let vc = BoxVC(item: item)
//    return vc
//  }
//}
//
//class BoxVC: UIViewController {
//  var item: Shit {
//    didSet {
//      label.text = item.name
//    }
//  }
//
//  let label = UILabel()
//
//  init(item: Shit) {
//    self.item = item
//    super.init(nibName: nil, bundle: nil)
//    view.addSubviews(label)
//    label.snp.remakeConstraints {
//      $0.center.equalToSuperview()
//    }
//  }
//
//  @available(*, unavailable)
//  required init?(coder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    view.backgroundColor = item.color
//  }
//}

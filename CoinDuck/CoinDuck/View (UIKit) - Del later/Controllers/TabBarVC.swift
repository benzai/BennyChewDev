//import Rswift
//import UIKit
//
//final class TabBarVC: UITabBarController {
//  enum Tab: Int {
//    case coins
//    case favorites
//    case portfolios
//  }
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    print("TabBarVC viewDidLoad")
//
//    viewControllers = [
//      tab(
//        page: AC.shared.coinsVC(),
//        title: "Coins",
//        icon: R.image.icon_coin, iconActive: R.image.icon_coin
//      ),
//      tab(
//        page: AC.shared.favoritesVC(),
//        title: "Favorites",
//        icon: R.image.icon_favorite, iconActive: R.image.icon_favorite
//      ),
//    ]
//  }
//}
//
//extension TabBarVC {
//  func performDeepLink(videoUrl: URL) {
////    switchTab(to: .videos)
////    let page = AC.shared.videoPlayerPage(videoUrl: videoUrl)
////    present(page, animated: true)
//  }
//
//  func switchTab(to tab: Tab) {
//    guard let viewControllers = viewControllers,
//          tab.rawValue < viewControllers.count,
//          tab.rawValue >= 0 else { return }
//    selectedIndex = tab.rawValue
//  }
//}
//
//private extension TabBarVC {
//  func tab(
//    page: UIViewController,
//    title: String,
//    icon: ImageResource,
//    iconActive: ImageResource,
//    withNavController: Bool = true
//  ) -> UIViewController {
//    let tab = withNavController ? UINavigationController(rootViewController: page) : page
//    page.title = title
//    let tabBarItem = UITabBarItem(
//      title: nil,
//      image: UIImage(named: icon.name)?.withRenderingMode(.alwaysTemplate),
//      selectedImage: UIImage(named: iconActive.name)?.withRenderingMode(.alwaysTemplate)
//    )
//    tabBarItem.image?.withTintColor(.white)
//    tabBarItem.selectedImage?.withTintColor(.blue)
//    tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
//    page.tabBarItem = tabBarItem
//    return tab
//  }
//}

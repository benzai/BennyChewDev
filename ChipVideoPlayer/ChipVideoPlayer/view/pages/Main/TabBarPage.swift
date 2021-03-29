import UIKit
import Rswift

/// TabBarPage
final class TabBarPage: UITabBarController {
  override func viewDidLoad() {
    super.viewDidLoad()
    print("TabBarPage viewDidLoad")

    viewControllers = [
      tab(page: AC.shared.videosPage(), title: "Videos", icon: R.image.videos28),
      tab(page: AC.shared.searchPage(), title: "Search", icon: R.image.search28),
      tab(page: AC.shared.settingsPage(), title: "Account", icon: R.image.account28),
    ]
  }
}

extension TabBarPage {
  func switchTab(to index: Int) {
    guard let viewControllers = viewControllers,
          index < viewControllers.count,
          index >= 0 else { return }
    selectedIndex = index
  }
}

private extension TabBarPage {
  func tab(
    page: UIViewController,
    title: String,
    icon: ImageResource
  ) -> UINavigationController {
    let navController = UINavigationController(rootViewController: page)
    page.title = title
    page.tabBarItem = UITabBarItem(
      title: title,
      image: UIImage(named: icon.name),
      selectedImage: nil
    )
    return navController
  }
}

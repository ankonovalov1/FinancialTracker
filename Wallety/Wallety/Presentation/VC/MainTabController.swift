import UIKit

final class MainTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = R.color.secondaryBackground()
        tabBar.barTintColor = R.color.secondaryBackground()
        tabBar.isTranslucent = false
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        
        viewControllers?.forEach{
            $0.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        }
    }
    
}

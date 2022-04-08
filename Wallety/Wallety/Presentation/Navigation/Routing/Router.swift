import Foundation
import UIKit

protocol RouterProtocol {
    func configure() -> UIViewController
}

struct MainTabScreenRouter: RouterProtocol {
    
    func configure() -> UIViewController {
        let tabVC = MyTabVC()
        tabVC.setViewControllers([MainScreenVC(),StatisticScreenVC(),ProfileScreenVC(),SettingsScreenVC()], animated: false)
        return tabVC
    }
    
}


struct MainScreenRouter: RouterProtocol {
    
    func configure() -> UIViewController {
        return MainScreenVC()
    }
    
}

struct SplashScreenRouter: RouterProtocol {
    
    func configure() -> UIViewController {
        guard
            let delegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
            let navigationController = delegate.navigationController,
            let factory = delegate.routerFactory
        else { return UIViewController() }
        let navigator = Navigator(navigationController: navigationController, factory: factory)
        return SplashScreenVC(navigator: navigator)
    }
    
}

struct AfterLaunchScreenRouter: RouterProtocol {
    
    func configure() -> UIViewController {
        guard
            let delegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
            let navigationController = delegate.navigationController,
            let factory = delegate.routerFactory
        else { return UIViewController() }
        let navigator = Navigator(navigationController: navigationController, factory: factory)
        return AfterLaunchVC(navigator: navigator)
    }
    
}

final class MyTabVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = R.color.secondaryBackground()
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController]?, animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        
        viewControllers?.forEach{
            $0.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        }
    }
    
}

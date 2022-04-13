import Foundation
import UIKit

protocol RouterProtocol {
    func configure() -> UIViewController
}

struct MainTabScreenRouter: RouterProtocol {
    
    func configure() -> UIViewController {
        let vc = MainTabController()
        vc.setViewControllers([MainScreenVC(),StatisticScreenVC(),ProfileScreenVC(),SettingsScreenVC()], animated: false)
        return vc
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

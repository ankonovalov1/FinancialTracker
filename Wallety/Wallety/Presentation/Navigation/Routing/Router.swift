import Foundation
import UIKit

protocol RouterProtocol {
    func configure() -> UIViewController
}

struct MainTabScreenRouter: RouterProtocol {
    
    func configure() -> UIViewController {
        let vc = MainTabController()
        vc.setViewControllers([
            MainScreenVC(),
            StatisticScreenVC(),
            ProfileScreenVC(),
            UINavigationController(rootViewController:  SettingsScreenVC())
        ], animated: false)
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
        let userDefaults = UserDefaultsService()
        let viewModel = SplashScreenVM(navigator: navigator, userDefaults: userDefaults)
        return SplashScreenVC(viewModel: viewModel)
    }
    
}

struct StartCurrencyScreenRouter: RouterProtocol {
    
    func configure() -> UIViewController {
        
        guard
            let delegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
            let navigationController = delegate.navigationController,
            let factory = delegate.routerFactory
        else { return UIViewController() }
        
        let navigator = Navigator(navigationController: navigationController, factory: factory)
        return StartCurrencyScreenVC(navigator: navigator)
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
        let userDefaults = UserDefaultsService()
        let viewModel = StartBalanceVM(navigator: navigator, userDefaults: userDefaults)
        return StartBalanceScreenVC(viewModel: viewModel)
    }
    
}

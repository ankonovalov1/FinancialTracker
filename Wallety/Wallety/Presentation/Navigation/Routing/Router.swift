import Foundation
import UIKit

protocol RouterProtocol {
    func configure() -> UIViewController
}

extension RouterProtocol {
    
    func sceneDelegate() -> SceneDelegate {
        return UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
    }
    
    func appDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
}

struct MainTabScreenRouter: RouterProtocol {
    
    func configure() -> UIViewController {
        let container = appDelegate().persistentContainer
        let balanceCDService = BalanceCDRepository(container: container)
        let currencyCDService = CurrencyCDRepository(container: container)
        let balanceVM = BalanceVM(balanceCDService: balanceCDService, currencyCDService: currencyCDService)
        
        let vc = MainTabController()
        vc.setViewControllers([
            MainScreenVC(balanceVM: balanceVM),
            StatisticScreenVC(),
            ProfileScreenVC(),
            UINavigationController(rootViewController:  SettingsScreenVC())
        ], animated: false)
        return vc
    }
    
}

struct MainScreenRouter: RouterProtocol {
    
    func configure() -> UIViewController {
        let container = appDelegate().persistentContainer
        let balanceCDService = BalanceCDRepository(container: container)
        let currencyCDService = CurrencyCDRepository(container: container)
        let balanceVM = BalanceVM(balanceCDService: balanceCDService, currencyCDService: currencyCDService)
        return MainScreenVC(balanceVM: balanceVM)
    }
    
}

struct SplashScreenRouter: RouterProtocol {
    
    func configure() -> UIViewController {
        
        guard
            let navigationController = sceneDelegate().navigationController,
            let factory = sceneDelegate().routerFactory
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
            let navigationController = sceneDelegate().navigationController,
            let factory = sceneDelegate().routerFactory
        else { return UIViewController() }
        
        let navigator = Navigator(navigationController: navigationController, factory: factory)
        let currencyCDService = CurrencyCDRepository(container: appDelegate().persistentContainer)
        let viewModel = StartCurrencyScreenVM(navigator: navigator, currencyCDService: currencyCDService)
        return StartCurrencyScreenVC(viewModel: viewModel)
    }
    
}

struct AfterLaunchScreenRouter: RouterProtocol {
    
    func configure() -> UIViewController {
        
        guard
            let navigationController = sceneDelegate().navigationController,
            let factory = sceneDelegate().routerFactory
        else { return UIViewController() }
        
        let navigator = Navigator(navigationController: navigationController, factory: factory)
        let userDefaults = UserDefaultsService()
        let container = appDelegate().persistentContainer
        let  balanceCDService = BalanceCDRepository(container: container)
        let validator = BalanceValidator()
        let viewModel = StartBalanceVM(navigator: navigator, userDefaults: userDefaults,
                                       balanceCDService: balanceCDService, validator: validator)
        return StartBalanceScreenVC(viewModel: viewModel)
    }
    
}

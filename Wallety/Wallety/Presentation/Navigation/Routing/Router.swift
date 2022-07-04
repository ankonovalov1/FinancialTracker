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
        
        let mainScreenRouter = MainScreenRouter()
        let mainScreenVC = mainScreenRouter.configure()
        
        let settingsScreenRouter = SettingsScreenRouter()
        let settingsScreenVC = settingsScreenRouter.configure()
        
        let vc = MainTabController()
        vc.setViewControllers([
            mainScreenVC,
            StatisticScreenVC(),
            ProfileScreenVC(),
            settingsScreenVC
        ], animated: false)
        return vc
    }
    
}

struct MainScreenRouter: RouterProtocol {
    
    func configure() -> UIViewController {
        
        guard
            let navigationController = sceneDelegate().navigationController,
            let factory = sceneDelegate().routerFactory
        else { return UIViewController() }
        
        let navigator = Navigator(navigationController: navigationController, factory: factory)
        let transactionInteractor = DIFactory.shared.resolve(type: TransactionInteractorProtocol.self)
        let balanceInteractor = DIFactory.shared.resolve(type: BalanceInteractorProtocol.self)
        let currencyInteractor = DIFactory.shared.resolve(type: CurrencyInteractorProtocol.self)
        let balanceVM = BalanceVM(balanceInteractor: balanceInteractor, currencyInteractor: currencyInteractor)
        let mainScreenVM = MainScreenVM(navigator: navigator)
        let transactionsVM = TransactionsListVM(transactionInteractor: transactionInteractor)
        
        return MainScreenVC(mainScreenVM: mainScreenVM,
                            balanceVM: balanceVM,
                            transactionsVM: transactionsVM)
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
        let currencyInteractor = DIFactory.shared.resolve(type: CurrencyInteractorProtocol.self)
        let viewModel = StartCurrencyScreenVM(navigator: navigator, currencyInteractor: currencyInteractor)
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
        let balanceInteractor = DIFactory.shared.resolve(type: BalanceInteractorProtocol.self)
        let validator = BalanceValidator()
        let viewModel = StartBalanceVM(navigator: navigator, userDefaults: userDefaults,
                                       balanceInteractor: balanceInteractor, validator: validator)
        return StartBalanceScreenVC(viewModel: viewModel)
    }
    
}

struct AddTransactionScreenRouter: RouterProtocol {
    
    func configure() -> UIViewController {
        
        let validator = BalanceValidator()
        let viewModel = AddTransactionVM(validator: validator)
        
        return AddTransactionScreenVC(viewModel: viewModel)
    }
    
}

struct SettingsScreenRouter: RouterProtocol {
    
    func configure() -> UIViewController {
        guard
            let navigationController = sceneDelegate().navigationController,
            let factory = sceneDelegate().routerFactory
        else { return UIViewController() }
        
        let navigator = Navigator(navigationController: navigationController, factory: factory)
        let viewModel = SettingsScreenVM(navigator: navigator)
        
        return UINavigationController(rootViewController: SettingsScreenVC(viewModel: viewModel))
    }
}

struct NotificationsScreenRouter: RouterProtocol {
    
    func configure() -> UIViewController {
        return NotificationScreenVC()
    }
}

struct CategoriesScreenRouter: RouterProtocol {
    
    func configure() -> UIViewController {
        
        let interactor = DIFactory.shared.resolve(type: TransactionCategoryInteractorProtocol.self)
        let categoriesScreenVM = CategoriesScreenVM(transactionCategoriesInteractor: interactor)
        
        return CategoriesScreenVC(categoriesScreenVM: categoriesScreenVM)
    }
}

struct PrivacyPolicyScreenRouter: RouterProtocol {
    
    func configure() -> UIViewController {
        return PrivacyPolicyVC()
    }
}

struct AboutScreenRouter: RouterProtocol {
    
    func configure() -> UIViewController {
        return AboutScreenVC()
    }
}

import Foundation

protocol RouterFactoryProtocol {
    func createRouter(for path: Destination) -> RouterProtocol
}

struct RouterFactory: RouterFactoryProtocol {
    
    func createRouter(for path: Destination) -> RouterProtocol {
        switch path {
        case .main:
            return MainScreenRouter()
        case .setCurrency:
            return StartCurrencyScreenRouter()
        case .setBalance:
            return AfterLaunchScreenRouter()
        case .splash:
            return SplashScreenRouter()
        case .mainTabScreen:
            return MainTabScreenRouter()
        case .addTransaction:
            return AddTransactionScreenRouter()
        case .notifications:
            return NotificationsScreenRouter()
        case .categories:
            return CategoriesScreenRouter()
        case .privacyPolicy:
            return PrivacyPolicyScreenRouter()
        case .aboutApp:
            return AboutScreenRouter()
        }
    }
    
}

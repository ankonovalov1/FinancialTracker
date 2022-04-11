import Foundation

protocol RouterFactoryProtocol {
    func createRouter(for path: Destination) -> RouterProtocol
}

struct RouterFactory: RouterFactoryProtocol {
    
    func createRouter(for path: Destination) -> RouterProtocol {
        switch path {
        case .main:
            return MainScreenRouter()
        case .afterLaunch:
            return AfterLaunchScreenRouter()
        case .splash:
            return SplashScreenRouter()
        case .mainTabScreen:
            return MainTabScreenRouter()
        }
    }
    
}

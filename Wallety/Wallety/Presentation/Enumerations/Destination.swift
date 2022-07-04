import Foundation

enum Destination {
    
    // Main transitions
    case splash
    case setCurrency
    case setBalance
    case main
    case mainTabScreen
    case addTransaction
    case notifications
    case categories
    case privacyPolicy
    case aboutApp

}

enum SettingCellType {
    
    case theme
    case currency
    case notification
    case categories
    case mark
    case policy
    case about
    case none
    
    var name: String {
        get {
            switch self {
            case .theme:
                return R.string.localizable.theme()
            case .currency:
                return R.string.localizable.currency()
            case .notification:
                return R.string.localizable.notifications()
            case .categories:
                return R.string.localizable.categories()
            case .mark:
                return R.string.localizable.appReview()
            case .policy:
                return R.string.localizable.privacyPolicy()
            case .about:
                return R.string.localizable.aboutApp()
            case .none:
                return ""
            }
        }
    }
    
}


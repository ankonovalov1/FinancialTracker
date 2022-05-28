import Foundation

final class StartBalanceVM {
    
    // MARK: Internal properties
    
    var balanceChanged: ((Bool) -> ())?
    var isBalanceEmpty: Bool = true {
        didSet {
            balanceChanged?(isBalanceEmpty)
        }
    }
    
    // MARK: Private properties
    
    private let navigator: NavigatorProtocol
    private let userDefaults: UserDefaultsProtocol
    
    // MARK: Lifecycle
    
    init(navigator: NavigatorProtocol, userDefaults: UserDefaultsProtocol) {
        self.navigator = navigator
        self.userDefaults = userDefaults
    }
    
    deinit {
        print("StartBalanceVM - was disposed")
    }
    
    // MARK: Internal functions
    
    func setBalanceSkipped() {
        userDefaults.set(object: true, for: UserDefaultsKeys.skipAfterLaunch)
        navigator.navigate(to: .mainTabScreen)
    }
    
    func setBalance() {
        userDefaults.set(object: true, for: UserDefaultsKeys.skipAfterLaunch)
        navigator.navigate(to: .mainTabScreen)
    }
    
}

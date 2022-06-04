import Foundation

final class StartCurrencyScreenVM {
    
    // MARK: Internal properties
    
    var currentSegmentTitle: String = ""
    
    // MARK: Private properties
    
    private let navigator: NavigatorProtocol
    private let userDefaults: UserDefaultsProtocol
    
    // MARK: Lifecycle
    
    init(navigator: NavigatorProtocol, userDefaults: UserDefaultsProtocol) {
        self.navigator = navigator
        self.userDefaults = userDefaults
    }
    
    deinit {
        print("StartCurrencyScreenVM - was disposed")
    }
    
    // MARK: Internal func
    
    func setCurrency() {
        userDefaults.set(object: currentSegmentTitle, for: UserDefaultsKeys.appCurrency)
        navigator.navigate(to: .setBalance)
    }
    
}

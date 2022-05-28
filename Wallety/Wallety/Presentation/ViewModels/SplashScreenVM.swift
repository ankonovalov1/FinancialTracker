import Foundation

final class SplashScreenVM {
    
    // MARK: Properties
    
    private let navigator: NavigatorProtocol
    private let userDefaults: UserDefaultsProtocol
    
    // MARK: - Lifecycle
    
    init(navigator: NavigatorProtocol, userDefaults: UserDefaultsProtocol) {
        self.navigator = navigator
        self.userDefaults = userDefaults
    }
    
    deinit {
        print("SplashScreenVM - was disposed")
    }
    
    // MARK: - Internal functions
    
    func viewDidAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            if let isExist = self.userDefaults.get(objectFor: UserDefaultsKeys.skipAfterLaunch) as? Bool, isExist {
                self.navigator.navigate(to: .mainTabScreen)
            }
            else {
                self.navigator.navigate(to: .setCurrency)
            }
        }
    }
    
}

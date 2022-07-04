import Foundation
import UIKit

final class SettingsScreenVM {
    
    // MARK: - Properties
    
    let data: [SettingVM]
    private let navigator: NavigatorProtocol
    
    // MARK: - Lifecycle
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
        data = DefaultModelGenerator.generateSettingsVM()
    }
    
    deinit {
        print("SettingsScreenVM - was disposed")
    }
    
    func push(to: Destination, from: UINavigationController?) {
        navigator.push(to, from: from)
    }
    
}

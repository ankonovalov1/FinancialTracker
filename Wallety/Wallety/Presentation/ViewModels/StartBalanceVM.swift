import Foundation

final class StartBalanceVM {
    
    // MARK: Internal properties
    
    var balanceChanged: ((Bool) -> ())?
    var isBalanceEmpty: Bool = true {
        didSet {
            balanceChanged?(isBalanceEmpty)
        }
    }
    var currentBalance: String = ""
    
    // MARK: Private properties
    
    private let navigator: NavigatorProtocol
    private let userDefaults: UserDefaultsProtocol
    private let balanceCDService: CoreDataProtocol
    private let validator: ValidationProtocol
    
    // MARK: Lifecycle
    
    init(navigator: NavigatorProtocol,
         userDefaults: UserDefaultsProtocol,
         balanceCDService: CoreDataProtocol,
         validator: ValidationProtocol) {
        self.navigator = navigator
        self.userDefaults = userDefaults
        self.balanceCDService = balanceCDService
        self.validator = validator
        
        self.validator.parameters = BalanceValidationParams.allCases
    }
    
    deinit {
        print("StartBalanceVM - was disposed")
    }
    
    // MARK: Internal functions
    
    func setBalanceSkipped() {
        userDefaults.set(object: true, for: UserDefaultsKeys.skipAfterLaunch)
        createBalance(isEmpty: true)
        navigator.navigate(to: .mainTabScreen)
    }
    
    func setBalance() {
        userDefaults.set(object: true, for: UserDefaultsKeys.skipAfterLaunch)
        createBalance(isEmpty: false)
        navigator.navigate(to: .mainTabScreen)
    }
    
    func createBalance(isEmpty: Bool) {
        if isEmpty {
            let model = BalanceModel(value: 0)
            balanceCDService.addOrUpdate(model: model)
        } else {
            let balance = Double(currentBalance)
            let model = BalanceModel(value: balance ?? 0)
            balanceCDService.addOrUpdate(model: model)
        }
    }
    
    func validate(fullValue: String?, value: String) -> Bool {
        let model = (full: fullValue, new: value)
        return validator.validate(value: model)
    }
    
}

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
    
    // MARK: Lifecycle
    
    init(navigator: NavigatorProtocol,
         userDefaults: UserDefaultsProtocol,
         balanceCDService: CoreDataProtocol) {
        self.navigator = navigator
        self.userDefaults = userDefaults
        self.balanceCDService = balanceCDService
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
        let id = StaticResources.deviceUDID
        if isEmpty {
            let model = BalanceMappingModel(id: id, ruble: 0, euro: 0, dollar: 0)
            balanceCDService.addOrUpdate(model: model)
        } else {
            let balance = NSDecimalNumber(string: currentBalance)
            let model = BalanceMappingModel(id: id, ruble: balance, euro: balance, dollar: balance)
            balanceCDService.addOrUpdate(model: model)
        }
    }
    
}

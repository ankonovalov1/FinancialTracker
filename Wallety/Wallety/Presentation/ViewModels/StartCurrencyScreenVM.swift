import Foundation

final class StartCurrencyScreenVM {
    
    // MARK: Internal properties
    
    var currency: CurrencyModel?
    
    // MARK: Private properties
    
    private let navigator: NavigatorProtocol
    private let currencyCDService: CoreDataProtocol
    
    // MARK: Lifecycle
    
    init(navigator: NavigatorProtocol, currencyCDService: CoreDataProtocol) {
        self.navigator = navigator
        self.currencyCDService = currencyCDService
    }
    
    deinit {
        print("StartCurrencyScreenVM - was disposed")
    }
    
    // MARK: Internal func
    
    func setCurrency() {
        guard let currency = currency else {
            return
        }
        currencyCDService.addOrUpdate(model: currency)
    }
    
    func showSetBalanceScreen() {
        navigator.navigate(to: .setBalance)
    }
    
}

import Foundation

final class StartCurrencyScreenVM {
    
    // MARK: Internal properties
    
    var currency: CurrencyModel?
    
    // MARK: Private properties
    
    private let navigator: NavigatorProtocol
    private let currencyInteractor: CurrencyInteractorProtocol
    
    // MARK: Lifecycle
    
    init(navigator: NavigatorProtocol,
         currencyInteractor: CurrencyInteractorProtocol) {
        self.navigator = navigator
        self.currencyInteractor = currencyInteractor
    }
    
    deinit {
        print("StartCurrencyScreenVM - was disposed")
    }
    
    // MARK: Internal func
    
    func setCurrency() {
        guard let currency = currency else {
            return
        }
        currencyInteractor.add(currency: currency)
    }
    
    func showSetBalanceScreen() {
        navigator.navigate(to: .setBalance)
    }
    
}

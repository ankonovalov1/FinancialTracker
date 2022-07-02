import Foundation

final class BalanceVM {
    
    // MARK: Callbacks
    
    var balanceChanged: ((String) -> Void)?
    
    // MARK: Internal properties
    
    var numberBalance: Double = 0
    var currentBalance: String {
        get {
            numberBalance.formatWith(digit: 2, locale: currentCurrency.locale) ?? "0"
        }
    }
    var currentCurrency = CurrencyModel(type: .dollar)
    
    // MARK: Private properties
    
    private let balanceInteractor: BalanceInteractorProtocol
    private let currencyInteractor: CurrencyInteractorProtocol
    
    // MARK: Lifecycle
    
    init(balanceInteractor: BalanceInteractorProtocol,
         currencyInteractor: CurrencyInteractorProtocol) {
        self.balanceInteractor = balanceInteractor
        self.currencyInteractor = currencyInteractor
    }
    
    deinit {
        print("BalanceVM - was disposed")
    }
    
    func viewDidLoad() {
        loadCurrency()
        loadBalance()
        balanceChanged?(currentBalance)
    }
    
    private func loadBalance() {
        guard
            let balance = balanceInteractor.get()
        else {
            numberBalance = 0
            return
        }
        numberBalance = balance.value
    }
    
    private func loadCurrency() {
        guard let currency = currencyInteractor.get() else {
            return
        }
        currentCurrency = currency
    }
    
}

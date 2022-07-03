import Foundation
import Combine

final class BalanceVM: ObservableObject {
    
    // MARK: Internal properties
    
    @Published var currentBalance: String?
    
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
    }
    
    private func loadBalance() {
        guard
            let balance = balanceInteractor.get()
        else {
            currentBalance = Double(0).formatWith(digit: 2, locale: currentCurrency.locale) ?? "0.00"
            return
        }
        currentBalance = balance.value.formatWith(digit: 2, locale: currentCurrency.locale) ?? "0.00"
    }
    
    private func loadCurrency() {
        guard let currency = currencyInteractor.get() else {
            return
        }
        currentCurrency = currency
    }
    
}

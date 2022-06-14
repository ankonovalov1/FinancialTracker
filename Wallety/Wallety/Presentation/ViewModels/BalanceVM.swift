import Foundation

final class BalanceVM {
    
    // MARK: Callbacks
    
    var balanceChanged: ((String) -> Void)?
    
    // MARK: Internal properties
    
    var numberBalance: Double = 0 {
        didSet {
            balanceChanged?(currentBalance)
        }
    }
    var currentBalance: String {
        get {
            numberBalance.formatWith(digit: 2, locale: currentCurrency.locale) ?? "0"
        }
    }
    var currentCurrency = CurrencyModel(type: .dollar)
    
    // MARK: Private properties
    
    private let balanceCDService: CoreDataProtocol
    private let currencyCDService: CoreDataProtocol
    
    // MARK: Lifecycle
    
    init(balanceCDService: CoreDataProtocol,
         currencyCDService: CoreDataProtocol) {
        self.balanceCDService = balanceCDService
        self.currencyCDService = currencyCDService
    }
    
    deinit {
        print("BalanceVM - was disposed")
    }
    
    func viewDidLoad() {
        loadCurrency()
        loadBalance()
    }
    
    func setBalance() {
        let model = BalanceMappingModel(value: 150)
        balanceCDService.addOrUpdate(model: model)
    }
    
    private func loadBalance() {
        guard
            let balances = balanceCDService.getAll() as? [Balance],
            let balance = balances.first
        else {
            numberBalance = 0
            return
        }
        numberBalance = balance.value
    }
    
    private func loadCurrency() {
        guard let currencies = currencyCDService.getAll(),
                let currency = currencies.first else {
            return
        }
        currentCurrency = CurrencyModel(model: currency)
    }
    
}

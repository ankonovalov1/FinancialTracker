import Foundation

final class BalanceVM {
    
    // MARK: Internal properties
    var numberBalance: Double = 0
    var currentBalance: String {
        get {
            numberBalance.formatWith() ?? "0"
        }
    }
    
    // MARK: Private properties
    
    private let balanceCDService: CoreDataProtocol
    
    // MARK: Lifecycle
    
    init(balanceCDService: CoreDataProtocol) {
        self.balanceCDService = balanceCDService
    }
    
    deinit {
        print("BalanceVM - was disposed")
    }
    
    func getBalance() {
        guard
            let balances = balanceCDService.getAll() as? [Balance],
            let balance = balances.first
        else {
            numberBalance = 0
            return
        }
        numberBalance = balance.value
    }
    
    func setBalance() {
        let udid = StaticResources.deviceUDID
        let model = BalanceMappingModel(id: udid, value: 150)
        balanceCDService.addOrUpdate(model: model)
    }
    
}

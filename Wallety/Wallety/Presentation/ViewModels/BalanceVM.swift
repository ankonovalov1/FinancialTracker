import Foundation

final class BalanceVM {
    
    // MARK: Internal properties
    
    var currentBalance: String = ""
    
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
            currentBalance = "0"
            return
        }
        currentBalance = balance.ruble?.stringValue ?? "0"
    }
    
}

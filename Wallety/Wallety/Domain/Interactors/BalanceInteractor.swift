import Foundation

protocol BalanceInteractorProtocol {
    func add(balance: BalanceModel)
    func update(balance: BalanceModel)
    func get() -> BalanceModel?
    func delete()
}

final class BalanceInteractor: BalanceInteractorProtocol {
    
    // MARK: - Properties
    
    private let balanceStorage: BalanceStorageProtocol
    private let balanceRepository: CoreDataProtocol
    
    // MARK: - Lifecycle
    
    init(balanceStorage: BalanceStorageProtocol,
         balanceRepository: CoreDataProtocol) {
        self.balanceStorage = balanceStorage
        self.balanceRepository = balanceRepository
    }
    
    // MARK: - BalanceInteractorProtocol
    
    func add(balance: BalanceModel) {
        balanceStorage.add(balance: balance)
        balanceRepository.addOrUpdate(model: balance)
    }
    
    func update(balance: BalanceModel) {
        balanceStorage.update(balance: balance)
        balanceRepository.addOrUpdate(model: balance)
    }
    
    func get() -> BalanceModel? {
        return balanceStorage.get()
    }
    
    func delete() {
        balanceStorage.delete()
        balanceRepository.deleteAll()
    }
    
    
}




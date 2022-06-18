import Foundation

protocol TransactionInteractorProtocol {
    func add(transaction: TransactionModel)
    func update(transaction: TransactionModel)
    func get(by id: String) -> TransactionModel?
    func getAll() -> Set<TransactionModel>
    func delete(transaction: TransactionModel)
    func deleteAll()
}

final class TransactionInteractor: TransactionInteractorProtocol {
    
    // MARK: - Properties
    
    private let transactionStorage: TransactionStorageProtocol
    private let transactionRepository: CoreDataProtocol
    
    // MARK: - Lifecycle
    
    init(transactionStorage: TransactionStorageProtocol,
         transactionRepository: CoreDataProtocol) {
        self.transactionStorage = transactionStorage
        self.transactionRepository = transactionRepository
    }
    
    // MARK: - TransactionInteractorProtocol
    
    func add(transaction: TransactionModel) {
        transactionStorage.add(transaction: transaction)
        transactionRepository.addOrUpdate(model: transaction)
    }
    
    func update(transaction: TransactionModel) {
        transactionStorage.update(transaction: transaction)
        transactionRepository.addOrUpdate(model: transaction)
    }
    
    func get(by id: String) -> TransactionModel? {
        return transactionStorage.get(by: id)
    }
    
    func getAll() -> Set<TransactionModel> {
        return transactionStorage.getAll()
    }
    
    func delete(transaction: TransactionModel) {
        transactionStorage.delete(transaction: transaction)
        transactionRepository.delete(model: transaction)
    }
    
    func deleteAll() {
        transactionStorage.deleteAll()
        transactionRepository.deleteAll()
    }
}

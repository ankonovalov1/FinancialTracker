import Foundation


protocol TransactionCategoryProtocol {
    func add(transaction: TransactionCategoryModel)
    func update(transaction: TransactionCategoryModel)
    func get(by id: String) -> TransactionCategoryModel?
    func getAll() -> Set<TransactionCategoryModel>
    func delete(transaction: TransactionCategoryModel)
    func deleteAll()
}

final class TransactionCategoryInteractor {
    
    // MARK: - Properties
    
    private let transactionCategoryStorage: TransactionCategoryStorageProtocol
    private let transactionCategoryRepository: CoreDataProtocol
    
    // MARK: - Lifecycle
    
    init(transactionCategoryStorage: TransactionCategoryStorageProtocol,
         transactionCategoryRepository: CoreDataProtocol) {
        self.transactionCategoryStorage = transactionCategoryStorage
        self.transactionCategoryRepository = transactionCategoryRepository
    }
    
    // MARK: - TransactionInteractorProtocol
    
    func add(transactionCategory: TransactionCategoryModel) {
        transactionCategoryStorage.add(transactionCategory: transactionCategory)
        transactionCategoryRepository.addOrUpdate(model: transactionCategory)
    }
    
    func update(transactionCategory: TransactionCategoryModel) {
        transactionCategoryStorage.update(transactionCategory: transactionCategory)
        transactionCategoryRepository.addOrUpdate(model: transactionCategory)
    }
    
    func get(by id: String) -> TransactionCategoryModel? {
        return transactionCategoryStorage.get(by: id)
    }
    
    func getAll() -> Set<TransactionCategoryModel> {
        return transactionCategoryStorage.getAll()
    }
    
    func delete(transactionCategory: TransactionCategoryModel) {
        transactionCategoryStorage.delete(transactionCategory: transactionCategory)
        transactionCategoryRepository.delete(model: transactionCategory)
    }
    
    func deleteAll() {
        transactionCategoryStorage.deleteAll()
        transactionCategoryRepository.deleteAll()
    }
    
}
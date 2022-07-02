import Foundation

final class TransactionCategoryStorage: TransactionCategoryStorageProtocol {
    
    // MARK: - Properties
    
    private var transactionCategories = Set<TransactionCategoryModel>()
    private let queue = DispatchQueue(label: String(describing: TransactionCategoryStorage.self) + "Queue")
    
    // MARK: - TransactionStorageProtocol func
    
    func add(transactionCategory: TransactionCategoryModel) {
        queue.async {
            self.transactionCategories.insert(transactionCategory)
        }
    }
    
    func update(transactionCategory: TransactionCategoryModel) {
        queue.async {
            self.transactionCategories.update(with: transactionCategory)
        }
    }
    
    func get(by id: String) -> TransactionCategoryModel? {
        var copy: TransactionCategoryModel?
        queue.sync {
            let transactionCategory = self.transactionCategories.first {
                $0.id == id
            }
            copy = transactionCategory
        }
        return copy
    }
    
    func getAll() -> Set<TransactionCategoryModel> {
        var copy = Set<TransactionCategoryModel>()
        queue.sync {
            copy = self.transactionCategories
        }
        return copy
    }
    
    func delete(transactionCategory: TransactionCategoryModel) {
        queue.async {
            self.transactionCategories.remove(transactionCategory)
        }
    }
    
    func deleteAll() {
        queue.async {
            self.transactionCategories.removeAll()
        }
    }
    
    // MARK: - CoreDataMappable func
    
    func map(data: Any) -> Bool {
        guard let data = data as? [TransactionCategory] else {
            return false
        }
        for transactionCategory in data {
            let model = TransactionCategoryModel(model: transactionCategory)
            transactionCategories.insert(model)
        }
        return true
    }
    
    // MARK: - Resetable func
    
    func reset() {
        deleteAll()
    }
    
}

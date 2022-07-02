import Foundation

final class TransactionStorage: TransactionStorageProtocol {
    
    // MARK: - Properties
    
    private var transactions = Set<TransactionModel>()
    private let queue = DispatchQueue(label: String(describing: CurrencyStorage.self) + "Queue")
    
    // MARK: - TransactionStorageProtocol func
    
    func add(transaction: TransactionModel) {
        queue.async {
            self.transactions.insert(transaction)
        }
    }
    
    func update(transaction: TransactionModel) {
        queue.async {
            self.transactions.update(with: transaction)
        }
    }
    
    func get(by id: String) -> TransactionModel? {
        var copy: TransactionModel?
        queue.sync {
            let transaction = self.transactions.first {
                $0.id == id
            }
            copy = transaction
        }
        return copy
    }
    
    func getAll() -> Set<TransactionModel> {
        var copy = Set<TransactionModel>()
        queue.sync {
            copy = self.transactions
        }
        return copy
    }
    
    func delete(transaction: TransactionModel) {
        queue.async {
            self.transactions.remove(transaction)
        }
    }
    
    func deleteAll() {
        queue.async {
            self.transactions.removeAll()
        }
    }
    
    // MARK: - CoreDataMappable func
    
    func map(data: Any) -> Bool {
        guard let data = data as? [Transaction] else {
            return false
        }
        for transaction in data {
            let model = TransactionModel(model: transaction)
            transactions.insert(model)
        }
        return true
    }
    
    // MARK: - Resetable func
    
    func reset() {
        deleteAll()
    }
    
}

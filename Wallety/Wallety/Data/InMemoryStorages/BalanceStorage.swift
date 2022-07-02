import Foundation

final class BalanceStorage: BalanceStorageProtocol {
    
    // MARK: - Properties
    
    private var balance: BalanceModel?
    private let queue = DispatchQueue(label: String(describing: BalanceStorage.self) + "Queue")
    
    // MARK: - BalanceStorageProtocol func
    
    func add(balance: BalanceModel) {
        queue.async {
            self.balance = balance
        }
    }
    
    func update(balance: BalanceModel) {
        queue.async {
            self.balance = balance
        }
    }
    
    func get() -> BalanceModel? {
        var copy: BalanceModel?
        queue.sync {
            copy = self.balance
        }
        return copy
    }
    
    func delete() {
        queue.async {
            self.balance = nil
        }
    }
    
    // MARK: - CoreDataMappable func
    
    func map(data: Any) -> Bool {
        guard let data = data as? [Balance] else {
            return false
        }
        guard let first = data.first else {
            balance = BalanceModel(value: 0)
            return true
        }
        balance = BalanceModel(value: first.value)
        return true
    }
    
    // MARK: - Resetable func
    
    func reset() {
        delete()
    }
    
}

import Foundation

final class CurrencyStorage: CurrencyStorageProtocol, CoreDataMappable {
    
    // MARK: - Properties
    
    private var currency: CurrencyModel?
    private let queue = DispatchQueue(label: String(describing: CurrencyStorage.self) + "Queue")
    
    // MARK: - CurrencyStorageProtocol func
    
    func add(currency: CurrencyModel) {
        queue.async {
            self.currency = currency
        }
    }
    
    func update(currency: CurrencyModel) {
        queue.async {
            self.currency = currency
        }
    }
    
    func get() -> CurrencyModel? {
        var copy: CurrencyModel?
        queue.sync {
            copy = self.currency
        }
        return copy
    }
    
    func delete() {
        queue.async {
            self.currency = nil
        }
    }
    
    // MARK: - CoreDataMappable func
    
    func map(data: Any) -> Bool {
        guard let data = data as? [Currency] else {
            return false
        }
        guard let first = data.first else {
            currency = CurrencyModel(type: .dollar)
            return true
        }
        currency = CurrencyModel(model: first)
        return true
    }
    
    
}

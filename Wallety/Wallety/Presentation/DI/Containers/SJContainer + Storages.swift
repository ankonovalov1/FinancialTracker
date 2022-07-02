import Foundation

extension SJContainer {
    
    func registerStorages() {
        
        container.register(BalanceStorageProtocol.self) { _ in
            return BalanceStorage()
        }.inObjectScope(.container)
        
        container.register(CurrencyStorageProtocol.self) { _ in
            return CurrencyStorage()
        }.inObjectScope(.container)
        
        container.register(TransactionStorageProtocol.self) { _ in
            return TransactionStorage()
        }.inObjectScope(.container)
        
        container.register(TransactionCategoryStorageProtocol.self) { _ in
            return TransactionCategoryStorage()
        }.inObjectScope(.container)
    }
}

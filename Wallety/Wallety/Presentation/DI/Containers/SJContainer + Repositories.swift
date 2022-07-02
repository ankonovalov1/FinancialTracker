import Foundation

extension SJContainer {
    
    func registerRepositories() {
        
        guard let persistenContainer = persistenContainer else {
            fatalError("Check configure function")
        }
        
        container.register(CoreDataProtocol.self, name: "BalanceCDRepository") { _ in
            return BalanceCDRepository(container: persistenContainer)
        }.inObjectScope(.container)
        
        container.register(CoreDataProtocol.self, name: "CurrencyCDRepository") { _ in
            return CurrencyCDRepository(container: persistenContainer)
        }.inObjectScope(.container)
        
        container.register(CoreDataProtocol.self, name: "TransactionCDRepository") { _ in
            return TransactionCDRepository(container: persistenContainer)
        }.inObjectScope(.container)
        
        container.register(CoreDataProtocol.self, name: "TransactionCategoryCDRepository") { _ in
            return TransactionCategoryCDRepository(container: persistenContainer)
        }.inObjectScope(.container)
    }
}

import Foundation
import CoreData
import Swinject

final class SJContainer: ContainerProtocol {
    
    private let container: Container
    var persistenContainer: NSPersistentContainer?
    
    init() {
        container = Container()
    }
    
    func register() {
        registerStorages()
        registerRepositories()
        registerInteractors()
    }
    
    func resolve<T>(by type: T.Type) -> T? {
        return container.resolve(type)
    }
    
    func resolve<T>(by type: T.Type, name: String) -> T? {
        return container.resolve(type, name: name)
    }
    
    private func registerStorages() {
        
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
    
    private func registerRepositories() {
        
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
    
    private func registerInteractors() {
        
        container.register(BalanceInteractorProtocol.self) { resolver in
            return BalanceInteractor(balanceStorage: resolver.resolve(BalanceStorageProtocol.self)!,
                                     balanceRepository: resolver.resolve(CoreDataProtocol.self, name: "BalanceCDRepository")!)
        }.inObjectScope(.container)
        
        container.register(CurrencyInteractorProtocol.self) { resolver in
            return CurrencyInteractor(currencyStorage: resolver.resolve(CurrencyStorageProtocol.self)!,
                                      currencyRepository: resolver.resolve(CoreDataProtocol.self, name: "CurrencyCDRepository")!)
        }.inObjectScope(.container)
        
        container.register(TransactionInteractorProtocol.self) { resolver in
            return TransactionInteractor(transactionStorage: resolver.resolve(TransactionStorageProtocol.self)!,
                                         transactionRepository: resolver.resolve(CoreDataProtocol.self, name: "TransactionCDRepository")!)
        }.inObjectScope(.container)
        
        container.register(TransactionCategoryInteractorProtocol.self) { resolver in
            return TransactionCategoryInteractor(transactionCategoryStorage: resolver.resolve(TransactionCategoryStorageProtocol.self)!,
                                                 transactionCategoryRepository: resolver.resolve(CoreDataProtocol.self, name: "TransactionCategoryCDRepository")!)
        }.inObjectScope(.container)
        
        container.register(DataSyncable.self) { resolver in
            return DataSyncInteractor(repositories: [
                resolver.resolve(CoreDataProtocol.self, name: "BalanceCDRepository")!,
                resolver.resolve(CoreDataProtocol.self, name: "CurrencyCDRepository")!,
                resolver.resolve(CoreDataProtocol.self, name: "TransactionCDRepository")!,
                resolver.resolve(CoreDataProtocol.self, name: "TransactionCategoryCDRepository")!
            ], storages: [
                resolver.resolve(BalanceStorageProtocol.self)!,
                resolver.resolve(CurrencyStorageProtocol.self)!,
                resolver.resolve(TransactionStorageProtocol.self)!,
                resolver.resolve(TransactionCategoryStorageProtocol.self)!
            ])
        }.inObjectScope(.container)
    }
    
}

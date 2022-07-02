import Foundation

extension SJContainer {
    
    func registerInteractors() {
        
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

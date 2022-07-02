import Foundation

protocol BalanceStorageProtocol: CoreDataMappable, Resetable {
    func add(balance: BalanceModel)
    func update(balance: BalanceModel)
    func get() -> BalanceModel?
    func delete()
}

protocol CurrencyStorageProtocol: CoreDataMappable, Resetable {
    func add(currency: CurrencyModel)
    func update(currency: CurrencyModel)
    func get() -> CurrencyModel?
    func delete()
}

protocol TransactionStorageProtocol: CoreDataMappable, Resetable {
    func add(transaction: TransactionModel)
    func update(transaction: TransactionModel)
    func get(by id: String) -> TransactionModel?
    func getAll() -> Set<TransactionModel>
    func delete(transaction: TransactionModel)
    func deleteAll()
}

protocol TransactionCategoryStorageProtocol: CoreDataMappable, Resetable {
    func add(transactionCategory: TransactionCategoryModel)
    func update(transactionCategory: TransactionCategoryModel)
    func get(by id: String) -> TransactionCategoryModel?
    func getAll() -> Set<TransactionCategoryModel>
    func delete(transactionCategory: TransactionCategoryModel)
    func deleteAll()
}

import Foundation

protocol BalanceStorageProtocol {
    func add(balance: BalanceModel)
    func update(balance: BalanceModel)
    func get() -> BalanceModel?
    func delete()
}

protocol CurrencyStorageProtocol {
    func add(currency: CurrencyModel)
    func update(currency: CurrencyModel)
    func get() -> CurrencyModel?
    func delete()
}

protocol TransactionStorageProtocol {
    func add(transaction: TransactionModel)
    func update(transaction: TransactionModel)
    func get(by id: String) -> TransactionModel?
    func getAll() -> Set<TransactionModel>
    func delete(transaction: TransactionModel)
    func deleteAll()
}

import Foundation

final class TransactionsListVM {
    
    // MARK: - Callbacks
    
    var transactionsLoaded: (([TransactionModel]) -> Void)?
    
    // MARK: - Properties
    
    let transactionInteractor: TransactionInteractorProtocol
    var transactions = [TransactionModel]()
    
    // MARK: - Lifecycle
    
    init(transactionInteractor: TransactionInteractorProtocol) {
        self.transactionInteractor = transactionInteractor
    }
    
    deinit {
        print("TransactionsListVM - was disposed")
    }
    
    // MARK: - Internal
    
    func load() {
        transactions = Array(transactionInteractor.getAll())
        transactionsLoaded?(transactions)
    }
    
}

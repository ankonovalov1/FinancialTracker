import Foundation
import Combine

final class TransactionsListVM: ObservableObject {
    
    enum State {
        case empty
        case hasData
    }
    
    // MARK: - Properties
    
    let transactionInteractor: TransactionInteractorProtocol
    var transactions = [TransactionModel]()
    @Published var transactionsState: State = .empty
    
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
        if transactions.isEmpty {
            transactionsState = .empty
        } else {
            transactionsState = .hasData
        }
        
    }
    
}

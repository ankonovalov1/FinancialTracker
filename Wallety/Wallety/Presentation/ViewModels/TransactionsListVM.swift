import Foundation
import Combine
import UIKit

final class TransactionsListVM: ObservableObject {
    
    enum State {
        case empty
        case hasData
    }
    
    // MARK: - Properties
    
    let transactionInteractor: TransactionInteractorProtocol
    var transactions: [TransactionModel] = [
    
        .init(id: "1",
              value: 4340040.25,
              category: .init(id: "1", name: "CafeCafeCafeCafeCafe11111", type: .income, image: UIImage(systemName: "cart")),
              currency: "$",
              date: Date(),
              type: .income)
    ]
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
        //transactions = Array(transactionInteractor.getAll())
        if transactions.isEmpty {
            transactionsState = .empty
        } else {
            transactionsState = .hasData
        }
        
    }
    
}

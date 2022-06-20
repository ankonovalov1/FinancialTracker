import Foundation

final class AddTransactionVM {
    
    var type: TransactionType
    
    init(type: TransactionType) {
        self.type = type
    }
    
    deinit {
        print("AddTransactionVM - was disposed")
    }
    
}

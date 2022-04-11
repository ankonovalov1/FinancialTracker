import Foundation

struct TransactionVM {
    
    enum TransactionType {
        case ask
        case bid
    }
    
    var type: TransactionType
    var value: String
    var date: String
    var kind: String
    
}

import Foundation

struct TransactionModel: NSMappingModel {
    
    let id: String
    let value: Double
    let category: String
    let currency: String
    let date: Date
    let type: TransactionType
    
}

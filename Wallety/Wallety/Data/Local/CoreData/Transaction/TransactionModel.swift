import Foundation

struct TransactionModel: NSMappingModel, Hashable {
    
    let id: String
    let value: Double
    let category: String
    let currency: String
    let date: Date
    let type: TransactionType
    
    init(id: String,
    value: Double,
    category: String,
    currency: String,
    date: Date,
    type: TransactionType) {
        self.id = id
        self.value = value
        self.category = category
        self.currency = currency
        self.date = date
        self.type = type
    }
    
    init(model: Transaction) {
        id = model.id
        value = model.value
        category = model.category
        currency = model.currency
        date = model.date
        type = model.type == "income" ? .income : .expenses
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: TransactionModel, rhs: TransactionModel) -> Bool {
        return lhs.id == rhs.id
    }
    
}

import Foundation
import UIKit

struct TransactionCategoryModel: NSMappingModel, Hashable {
    
    let id: String
    let name: String
    let type: TransactionType
    let image: UIImage?
    var transactions = Set<TransactionModel>()
    
    init(id: String,
         name: String,
         type: TransactionType,
         image: UIImage?) {
        self.id = id
        self.name = name
        self.image = image
        self.type = type
    }
    
    init(model: TransactionCategory) {
        id = model.id
        name = model.name
        type = model.type == "income" ? .income : .expenses
        
        guard let imageData = model.image else {
            image = nil
            return
        }

        image = UIImage(data: imageData)
    }
    
    mutating func insert(transaction: TransactionModel) {
        transactions.insert(transaction)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: TransactionCategoryModel, rhs: TransactionCategoryModel) -> Bool {
        return lhs.id == rhs.id
    }
}

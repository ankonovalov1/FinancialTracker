import Foundation

struct TransactionCategoryModel: NSMappingModel, Hashable {
    
    let id: String
    let name: String
    let image: Data?
    
    init(id: String,
         name: String,
         image: Data?) {
        self.id = id
        self.name = name
        self.image = image
    }
    
    init(model: TransactionCategory) {
        self.id = model.id
        self.name = model.name
        self.image = model.image
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: TransactionCategoryModel, rhs: TransactionCategoryModel) -> Bool {
        return lhs.id == rhs.id
    }
}

import Foundation
import CoreData

final class TransactionCategoryCDRepository: CoreDataProtocol {
    
    // MARK: - Internal properties
    
    let container: NSPersistentContainer
    
    // MARK: - Private properties
    
    private(set) lazy var context: NSManagedObjectContext = {
        return container.viewContext
    }()
    
    // MARK: - Lifecycle
    
    init(container: NSPersistentContainer) {
        self.container = container
    }
    
    deinit {
        print("TransactionCategoryCDRepository - was disposed")
    }
    
    // MARK: - Internal fuctions
    
    func getAll() -> [NSManagedObject]? {
        let fetchRequest = TransactionCategory.fetchRequest()
        return try? context.fetch(fetchRequest)
    }
    
    func getWith(predicate: String) -> [NSManagedObject]? {
        let fetchRequest = TransactionCategory.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", predicate)
        return try? context.fetch(fetchRequest)
    }
    
    func addOrUpdate(model: NSMappingModel) {
        var transactionCategory: TransactionCategory?
        guard
            let model = model as? TransactionCategoryModel,
            let transactionCategories = getWith(predicate: model.id) as? [TransactionCategory]
        else {
            return
        }
        
        if transactionCategories.isEmpty {
            transactionCategory = TransactionCategory(context: context)
        } else {
            transactionCategory = transactionCategories.first
        }
        
        transactionCategory?.id = model.id
        transactionCategory?.name = model.name
        transactionCategory?.image = model.image
        
        save()
    }
    
    func delete(model: NSMappingModel) {
        guard
            let model = model as? TransactionCategoryModel,
            let managedObjects = getWith(predicate: model.id)
        else {
            return
        }
        managedObjects.forEach {
            context.delete($0)
        }
        save()
    }
    
    func deleteAll() {
        guard let transactionCategories = getAll() else {
            return
        }
        transactionCategories.forEach {
            context.delete($0)
        }
        save()
    }
}

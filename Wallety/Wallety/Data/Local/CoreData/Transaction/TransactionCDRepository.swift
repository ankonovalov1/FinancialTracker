import Foundation
import CoreData

final class TransactionCDRepository: CoreDataProtocol {

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
        print("CurrencyCDRepository - was disposed")
    }
    
    // MARK: - Internal fuctions
    
    func getAll() -> [NSManagedObject]? {
        let fetchRequest = Transaction.fetchRequest()
        return try? context.fetch(fetchRequest)
    }
    
    func getWith(predicate: String) -> [NSManagedObject]? {
        let fetchRequest = Transaction.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", predicate)
        return try? context.fetch(fetchRequest)
    }
    
    func addOrUpdate(model: NSMappingModel) {
        var transaction: Transaction?
        guard
            let model = model as? TransactionModel,
            let transactions = getWith(predicate: model.id) as? [Transaction]
        else {
            return
        }
        
        if transactions.isEmpty {
            transaction = Transaction(context: context)
        } else {
            transaction = transactions.first
        }
        
        transaction?.id = model.id
        transaction?.date = model.date
        transaction?.currency = model.currency
        transaction?.value = model.value
        transaction?.type = model.type.rawValue
        
        let fetch = TransactionCategory.fetchRequest()
        fetch.predicate = NSPredicate(format: "id = %@", model.category.id)
        if let categories = try? context.fetch(fetch), let category = categories.first {
            transaction?.category = category
        }
        
        save()
    }
    
    func addMany(models: [NSMappingModel]) {}
    
    func delete(model: NSMappingModel) {
        guard
            let model = model as? TransactionModel,
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
        guard let transactions = getAll() else {
            return
        }
        transactions.forEach {
            context.delete($0)
        }
        save()
    }
    
}


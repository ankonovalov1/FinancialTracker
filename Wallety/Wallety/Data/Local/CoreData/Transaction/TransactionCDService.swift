import Foundation
import CoreData

final class TransactionCDService: CoreDataProtocol {

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
        print("CurrencyCDService - was disposed")
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
        var currency: Transaction?
        guard
            let model = model as? TransactionModel,
            let currencies = getWith(predicate: model.id) as? [Transaction]
        else {
            return
        }
        
        if currencies.isEmpty {
            currency = Transaction(context: context)
        } else {
            currency = currencies.first
        }
        
        currency?.id = model.id
        currency?.date = model.date
        currency?.currency = model.currency
        currency?.value = model.value
        currency?.category = model.category
        currency?.type = model.type.rawValue
        
        save()
    }
    
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
    
}


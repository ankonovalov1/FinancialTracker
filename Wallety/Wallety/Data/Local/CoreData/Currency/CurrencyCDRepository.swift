import Foundation
import CoreData

final class CurrencyCDRepository: CoreDataProtocol {
    
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
        let fetchRequest = Currency.fetchRequest()
        return try? context.fetch(fetchRequest)
    }
    
    func getWith(predicate: String) -> [NSManagedObject]? {
        let fetchRequest = Currency.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", predicate)
        return try? context.fetch(fetchRequest)
    }
    
    func addOrUpdate(model: NSMappingModel) {
        var currency: Currency?
        guard
            let model = model as? CurrencyModel,
            let currencies = getWith(predicate: model.id) as? [Currency]
        else {
            return
        }
        
        if currencies.isEmpty {
            currency = Currency(context: context)
        } else {
            currency = currencies.first
        }
        
        currency?.id = model.id
        currency?.name = model.name
        currency?.locale = model.locale
        
        save()
    }
    
    func addMany(models: [NSMappingModel]) {}
    
    func delete(model: NSMappingModel) {
        guard
            let model = model as? CurrencyModel,
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
        guard let currencies = getAll() else {
            return
        }
        currencies.forEach {
            context.delete($0)
        }
        save()
    }
    
}


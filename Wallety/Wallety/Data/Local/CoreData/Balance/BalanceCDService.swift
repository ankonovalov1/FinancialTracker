import Foundation
import CoreData

final class BalanceCDService: CoreDataProtocol {
    
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
        print("BalanceCDService - was disposed")
    }
    
    // MARK: - Internal fuctions
    
    func getAll() -> [NSManagedObject]? {
        let fetchRequest = Balance.fetchRequest()
        return try? context.fetch(fetchRequest)
    }
    
    func getWith(predicate: String) -> [NSManagedObject]? {
        let fetchRequest = Balance.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id = %@", predicate)
        return try? context.fetch(fetchRequest)
    }
    
    func addOrUpdate(model: NSMappingModel) {
        var balance: Balance?
        guard
            let model = model as? BalanceMappingModel,
            let balances = getWith(predicate: model.id) as? [Balance]
        else {
            return
        }
        
        if balances.isEmpty {
            balance = Balance(context: context)
        } else {
            balance = balances.first
        }
        
        balance?.id = model.id
        balance?.value = model.value
        
        save()
    }
    
    func delete(model: NSMappingModel) {
        guard
            let model = model as? BalanceMappingModel,
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

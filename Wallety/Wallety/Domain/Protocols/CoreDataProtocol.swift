import Foundation
import CoreData

protocol CoreDataProtocol {
    var container: NSPersistentContainer { get }
    var context: NSManagedObjectContext { get }
    
    func save()
    func getAll() -> [NSManagedObject]?
    func getWith(predicate: String) -> [NSManagedObject]?
    func addOrUpdate(model: NSMappingModel)
    func addMany(models: [NSMappingModel])
    func delete(model: NSMappingModel)
    func deleteAll()
}

extension CoreDataProtocol {
    
    func save() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // TODO: Log error
            }
        }
    }

}

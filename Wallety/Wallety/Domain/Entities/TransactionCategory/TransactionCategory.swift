import Foundation
import CoreData

@objc(TransactionCategory)
public class TransactionCategory: NSManagedObject, Identifiable {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransactionCategory> {
        return NSFetchRequest<TransactionCategory>(entityName: "TransactionCategory")
    }

    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var image: Data?
    
}

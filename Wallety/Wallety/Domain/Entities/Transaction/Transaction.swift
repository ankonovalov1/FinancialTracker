import Foundation
import CoreData

@objc(Transaction)
public class Transaction: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var id: String
    @NSManaged public var value: Double
    @NSManaged public var category: String
    @NSManaged public var currency: String
    @NSManaged public var date: Date
    @NSManaged public var type: String
    
}

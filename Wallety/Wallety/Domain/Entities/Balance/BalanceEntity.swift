import Foundation
import CoreData

@objc(Balance)
public class Balance: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Balance> {
        return NSFetchRequest<Balance>(entityName: "Balance")
    }
    
    @NSManaged public var id: String?
    @NSManaged public var ruble: NSDecimalNumber?
    @NSManaged public var euro: NSDecimalNumber?
    @NSManaged public var dollar: NSDecimalNumber?
    
}

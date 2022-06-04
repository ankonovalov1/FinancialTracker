import Foundation
import CoreData

@objc(Balance)
public class Balance: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Balance> {
        return NSFetchRequest<Balance>(entityName: "Balance")
    }
    
    @NSManaged public var value: Double
    @NSManaged public var id: String?
    
}

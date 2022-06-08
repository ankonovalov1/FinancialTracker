import Foundation
import CoreData

@objc(Currency)
public class Currency: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Currency> {
        return NSFetchRequest<Currency>(entityName: "Currency")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var locale: String?
    
}

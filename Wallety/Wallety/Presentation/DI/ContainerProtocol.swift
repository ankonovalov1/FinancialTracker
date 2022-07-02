import Foundation
import CoreData

protocol ContainerProtocol: AnyObject {
    
    var persistenContainer: NSPersistentContainer? {get set}
    
    func register()
    func resolve<T>(by type: T.Type) -> T?
    func resolve<T>(by type: T.Type, name: String) -> T?
}

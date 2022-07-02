import Foundation
import CoreData

final class DIFactory {
    
    static let shared = DIFactory()
    
    private let container: ContainerProtocol
    
    private init() {
        container = SJContainer()
    }
    
    func resolve<T>(type: T.Type) -> T? {
        return container.resolve(by: type)
    }
    
    func resolve<T>(type: T.Type, name: String) -> T? {
        return container.resolve(by: type, name: name)
    }
    
    /// Use before resolve any dependency
    /// - Parameter persistenContainer: Core Data container to register and resolve dependencies
    func configure(persistenContainer: NSPersistentContainer) {
        container.persistenContainer = persistenContainer
        
        container.register()
    }
}

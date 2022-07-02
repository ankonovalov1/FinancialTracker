import Foundation
import CoreData

final class DIFactory {
    
    static let shared = DIFactory()
    
    private let container: ContainerProtocol
    
    private init() {
        container = SJContainer()
    }
    
    func resolve<T>(type: T.Type) -> T {
        guard let obj = container.resolve(by: type) else {
            fatalError("Bad register for \(type)")
        }
        return obj
    }
    
    func resolve<T>(type: T.Type, name: String) -> T {
        guard let obj = container.resolve(by: type, name: name) else {
            fatalError("Bad register for \(type) with name \(name)")
        }
        return obj
    }
    
    /// Use before resolve any dependency
    /// - Parameter persistenContainer: Core Data container to register and resolve dependencies
    func configure(persistenContainer: NSPersistentContainer) {
        container.persistenContainer = persistenContainer
        
        container.register()
    }
    
}

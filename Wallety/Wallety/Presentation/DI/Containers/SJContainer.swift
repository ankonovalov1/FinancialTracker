import Foundation
import CoreData
import Swinject

final class SJContainer: ContainerProtocol {
    
    private(set) var container: Container
    var persistenContainer: NSPersistentContainer?
    
    init() {
        container = Container()
    }
    
    func register() {
        registerStorages()
        registerRepositories()
        registerInteractors()
    }
    
    func resolve<T>(by type: T.Type) -> T? {
        return container.resolve(type)
    }
    
    func resolve<T>(by type: T.Type, name: String) -> T? {
        return container.resolve(type, name: name)
    }
    
}

import Foundation

protocol UserDefaultsProtocol {
    func set(object: Any, for key: String)
    func get(objectFor key: String) -> Any?
    func remove(objectFor key: String)
}

final class UserDefaultsService: UserDefaultsProtocol {
    
    private let storage = UserDefaults.standard
    
    func set(object: Any, for key: String) {
        storage.set(object, forKey: key)
    }
    
    func get(objectFor key: String) -> Any? {
        return storage.object(forKey: key)
    }
    
    func remove(objectFor key: String) {
        storage.removeObject(forKey: key)
    }
    
}

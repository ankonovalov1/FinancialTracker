import Foundation

protocol UserDefaultsProtocol {
    func set(object: Any, for key: String)
    func get(objectFor key: String) -> Any?
    func remove(objectFor key: String)
}

struct UserDefaultsService: UserDefaultsProtocol {
    
    func set(object: Any, for key: String) {
        UserDefaults.standard.set(object, forKey: key)
    }
    
    func get(objectFor key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
    
    func remove(objectFor key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}

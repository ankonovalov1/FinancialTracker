import Foundation
import CoreData

protocol DataSyncable {
    func sync()
    func reset()
}

final class DataSyncInteractor: DataSyncable {
    
    private let repositories: [CoreDataProtocol]
    private let storages: [CoreDataMappable]
    private let userDefaults: UserDefaultsProtocol
    
    init(repositories: [CoreDataProtocol],
         storages: [CoreDataMappable],
         userDefaults: UserDefaultsProtocol) {
        self.repositories = repositories
        self.storages = storages
        self.userDefaults = userDefaults
    }
    
    func sync() {
        prepareDefaults()
        for repository in repositories {
            guard let data = repository.getAll() else {
                continue
            }
            if data.isEmpty {
                continue
            }
            add(data: data)
        }
    }
    
    func reset() {
        for repository in repositories {
            repository.deleteAll()
        }
        for storage in storages {
            guard let resetable = storage as? Resetable else {
                continue
            }
            resetable.reset()
        }
    }
    
    private func add(data: [NSManagedObject]) {
        for storage in storages {
            let mapped = storage.map(data: data)
            if mapped {
                break
            } else {
                continue
            }
        }
    }
    
    private func prepareDefaults() {
        if let wasAdded = userDefaults.get(objectFor: UserDefaultsKeys.defaultCategoriesAdded) as? Bool, wasAdded == true {
            return
        } else {
            addDefaultCategories()
            userDefaults.set(object: true, for: UserDefaultsKeys.defaultCategoriesAdded)
        }
    }
    
    private func addDefaultCategories() {
        let repository = repositories.first { type in
            type is TransactionCategoryCDRepository
        }
        let categories = DefaultModelGenerator.generateDefaultCategories()
        repository?.addMany(models: Array(categories))
    }
    
}

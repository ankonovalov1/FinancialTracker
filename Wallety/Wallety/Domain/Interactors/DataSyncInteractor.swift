import Foundation
import CoreData

protocol DataSyncable {
    func sync()
}

final class DataSyncInteractor: DataSyncable {
    
    private let repositories: [CoreDataProtocol]
    private let storages: [CoreDataMappable]
    
    init(repositories: [CoreDataProtocol],
         storages: [CoreDataMappable]) {
        self.repositories = repositories
        self.storages = storages
    }
    
    func sync() {
        for repository in repositories {
            guard let data = repository.getAll() else {
                continue
            }
            add(data: data)
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
    
}

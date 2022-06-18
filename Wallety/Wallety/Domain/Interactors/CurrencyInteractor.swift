import Foundation

protocol CurrencyInteractorProtocol {
    func add(currency: CurrencyModel)
    func update(currency: CurrencyModel)
    func get() -> CurrencyModel?
    func delete()
}

final class CurrencyInteractor: CurrencyInteractorProtocol {
    
    // MARK: - Properties
    
    private let currencyStorage: CurrencyStorageProtocol
    private let currencyRepository: CoreDataProtocol
    
    // MARK: - Lifecycle
    
    init(currencyStorage: CurrencyStorageProtocol,
         currencyRepository: CoreDataProtocol) {
        self.currencyStorage = currencyStorage
        self.currencyRepository = currencyRepository
    }
    
    // MARK: - CurrencyInteractorProtocol
    
    func add(currency: CurrencyModel) {
        currencyStorage.add(currency: currency)
        currencyRepository.addOrUpdate(model: currency)
    }
    
    func update(currency: CurrencyModel) {
        currencyStorage.update(currency: currency)
        currencyRepository.addOrUpdate(model: currency)
    }
    
    func get() -> CurrencyModel? {
        return currencyStorage.get()
    }
    
    func delete() {
        currencyStorage.delete()
        currencyRepository.deleteAll()
    }
}

import Foundation
import CoreData

struct CurrencyModel: NSMappingModel {
    
    enum CurrencyType {
        case ruble
        case euro
        case dollar
    }
    
    let id: String
    let name: String
    let locale: String
    
    init(id: String, name: String, locale: String) {
        self.id = id
        self.name = name
        self.locale = locale
    }
    
    init(type: CurrencyType) {
        self.id = StaticResources.deviceUDID
        switch type {
        case .ruble:
            name = R.string.localizable.ruble()
            locale = "ru-RU"
        case .euro:
            name = R.string.localizable.euro()
            locale = "fr-FR"
        case .dollar:
            name = R.string.localizable.dollar()
            locale = "en-US"
        }
    }
    
    init(model: Currency) {
        self.init(id: model.id,
                  name: model.name,
                  locale: model.locale)
    }
    
}

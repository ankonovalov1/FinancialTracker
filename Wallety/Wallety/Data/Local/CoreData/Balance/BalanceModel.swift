import Foundation

struct BalanceModel: NSMappingModel {
    let id: String = StaticResources.deviceUDID
    let value: Double
}

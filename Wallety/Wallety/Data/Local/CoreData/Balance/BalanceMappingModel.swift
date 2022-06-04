import Foundation

struct BalanceMappingModel: NSMappingModel {
    let id: String
    let ruble: NSDecimalNumber
    let euro: NSDecimalNumber
    let dollar: NSDecimalNumber
}

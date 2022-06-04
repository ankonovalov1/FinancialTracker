import Foundation

struct RatesResponseDTO: Codable {
    let base: String?
    let rates: [String: Double]?
    
    static func defaultValue() -> Self {
        return RatesResponseDTO(base: "USD", rates: ["USD":1.0, "EUR":1.0, "RUB":1.0])
    }
}

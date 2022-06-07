import Foundation

protocol ValidationParams {}

enum BalanceValidationParams: ValidationParams, CaseIterable {
    case allowedSymbols
    case numberCorrectness
    case maximumLenght
}

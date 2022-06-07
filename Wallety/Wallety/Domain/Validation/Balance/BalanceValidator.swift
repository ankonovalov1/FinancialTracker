import Foundation

protocol ValidationProtocol: AnyObject {
    var parameters: [ValidationParams]? { get set }
    func validate(value: Any) -> Bool
}

final class BalanceValidator: ValidationProtocol {
    
    // MARK: - Properties
    var parameters: [ValidationParams]?
    
    func validate(value: Any) -> Bool {
        var validations = [Bool]()
        if let parameters = parameters as? [BalanceValidationParams], let value = value as? (full: String?, new: String) {
            parameters.forEach { parameter in
                switch parameter {
                case .allowedSymbols:
                    let passed = checkAllowedSymbols(value: value.new)
                    validations.append(passed)
                case .numberCorrectness:
                    let passed = checkNumberCorrectness(fullValue: value.full, value: value.new)
                    validations.append(passed)
                case .maximumLenght:
                    let passed = checkMaxOf(fullValue: value.full, value: value.new)
                    validations.append(passed)
                }
            }
            return validations.allSatisfy {
                $0 == true
            }
        } else {
            return true
        }
    }
    
    private func checkAllowedSymbols(value: String) -> Bool {
        let allowedCharacters = CharacterSet(charactersIn: "0123456789.")
        let characterSet = CharacterSet(charactersIn: value)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    private func checkNumberCorrectness(fullValue: String?, value: String) -> Bool {
        if let fullValue = fullValue {
            if fullValue.count == 14 && value == "." {
                return false
            }
            if fullValue.count == 15 && value != "" {
                return false
            }
        }
        return true
    }
    
    private func checkMaxOf(fullValue: String?, value: String, with limit: Int = 15) -> Bool {
        if let fullValue = fullValue {
            if fullValue.isEmpty && value == "." {
                return false
            }
            if fullValue == "0" && value != "." {
                if value == "" {
                    return true
                }
                return false
            }
            if fullValue.contains(".") && value == "." {
                return false
            }
            if fullValue.contains(".") && value != "" {
                if let range = fullValue.range(of: ".") {
                    let valueInRange = fullValue[range.upperBound...]
                    if valueInRange.count > 1 {
                        return false
                    }
                }
            }
        } else {
            if value != "." {
                return false
            }
        }
        return true
    }
    
}

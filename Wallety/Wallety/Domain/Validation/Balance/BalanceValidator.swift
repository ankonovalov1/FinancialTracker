import Foundation

protocol ValidationProtocol {
    var parameters: [ValidationParams]? { get set }
    func validate(value: Any) -> Bool
}

struct BalanceValidator: ValidationProtocol {
    
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
        let allowedCharacters = CharacterSet(charactersIn: "0123456789.,")
        let characterSet = CharacterSet(charactersIn: value)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
    private func checkNumberCorrectness(fullValue: String?, value: String) -> Bool {
        if let fullValue = fullValue {
            if fullValue.count == 14 && isDelimeter(value) {
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
            if fullValue.isEmpty && isDelimeter(value) {
                return false
            }
            if fullValue == "0" && !isDelimeter(value) {
                if value == "" {
                    return true
                }
                return false
            }
            if let _ = isContainDelimeter(fullValue), isDelimeter(value) {
                return false
            }
            if let delimeter = isContainDelimeter(fullValue), value != "" {
                if let range = fullValue.range(of: delimeter) {
                    let valueInRange = fullValue[range.upperBound...]
                    if valueInRange.count > 1 {
                        return false
                    }
                }
            }
        } else {
            if !isDelimeter(value) {
                return false
            }
        }
        return true
    }
    
    private func isDelimeter(_ value: String) -> Bool {
        return value == "." || value == ","
    }
    
    private func isContainDelimeter(_ fullValue: String) -> String? {
        if fullValue.contains(".") {
            return "."
        } else if fullValue.contains(",") {
            return ","
        }
        return nil
    }
    
}

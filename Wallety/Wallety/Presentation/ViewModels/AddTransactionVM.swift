import Foundation

final class AddTransactionVM {
    
    // MARK: - Callbacks
    
    var balanceChanged: ((Bool) -> ())?
    
    // MARK: - Properties
    
    var type: TransactionType = .income
    
    var isBalanceEmpty: Bool = true {
        didSet {
            balanceChanged?(isBalanceEmpty)
        }
    }
    
    private var validator: ValidationProtocol
    
    // MARK: Lifecycle
    
    init(validator: ValidationProtocol) {
        self.validator = validator
        self.validator.parameters = BalanceValidationParams.allCases
    }
    
    deinit {
        print("AddTransactionVM - was disposed")
    }
    
    // MARK: Internal func
    
    func validate(fullValue: String?, value: String) -> Bool {
        let model = (full: fullValue, new: value)
        return validator.validate(value: model)
    }
    
}

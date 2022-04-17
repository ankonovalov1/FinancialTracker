import Foundation

final class StartBalanceVM {
    
    var balanceChanged: ((Bool) -> ())?
    var isBalanceEmpty: Bool = true {
        didSet {
            balanceChanged?(isBalanceEmpty)
        }
    }
    
}

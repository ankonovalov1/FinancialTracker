import Foundation

final class AfterLaunchVM {
    
    var balanceChanged: ((Bool) -> ())?
    var isBalanceEmpty: Bool = true {
        didSet {
            balanceChanged?(isBalanceEmpty)
        }
    }
    
}

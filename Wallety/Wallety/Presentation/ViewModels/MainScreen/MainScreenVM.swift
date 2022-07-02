import Foundation

final class MainScreenVM {
    
    // MARK: - Properties
    
    let navigator: NavigatorProtocol
    
    // MARK: - Lifecycle
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
    
    deinit {
        print("MainScreenVM - was disposed")
    }
    
    // MARK: - Internal
    
    func openAddTransaction(with type: TransactionType) {
        let params: [String:Any] = [NavigationParams.transactionType: type]
        navigator.present(.addTransaction, params: params)
    }
    
}

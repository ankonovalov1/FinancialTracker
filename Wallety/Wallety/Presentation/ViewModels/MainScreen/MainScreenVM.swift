import Foundation

final class MainScreenVM {
    
    let navigator: NavigatorProtocol
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
    }
    
    var transactions: [TransactionVM] = [
        TransactionVM(type: .bid, value: "232.4", date: "8 апреля 2022", kind: "Еда"),
        TransactionVM(type: .ask, value: "22.4", date: "8 апреля 2022", kind: "Кешбэк"),
        TransactionVM(type: .bid, value: "123.4", date: "8 апреля 2022", kind: "Аренда"),
        TransactionVM(type: .bid, value: "5.4", date: "8 апреля 2022", kind: "Налоги"),
        TransactionVM(type: .ask, value: "44.5", date: "8 апреля 2022", kind: "Инвестиции"),
        TransactionVM(type: .ask, value: "234.6", date: "8 апреля 2022", kind: "Зарплата"),
        TransactionVM(type: .bid, value: "82.1", date: "8 апреля 2022", kind: "Транспорт"),
        TransactionVM(type: .bid, value: "232.4", date: "8 апреля 2022", kind: "Другое"),
      
    ]
    
    func openAddTransaction(with type: TransactionType) {
        let params: [String:Any] = [NavigationParams.transactionType: type]
        navigator.present(.addTransaction, params: params)
    }
    
}

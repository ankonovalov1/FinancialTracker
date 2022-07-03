import Foundation

final class CategoriesScreenVM {
    
    // MARK: - Callbacks
    
    var categoriesLoaded: (() -> Void)?
    
    // MARK: - Properties
    
    private let transactionCategoriesInteractor: TransactionCategoryInteractorProtocol
    
    var incomeCategories = [TransactionCategoryModel]()
    var expensesCategories = [TransactionCategoryModel]()
    
    // MARK: - Lifecycle
    
    init(transactionCategoriesInteractor: TransactionCategoryInteractorProtocol) {
        self.transactionCategoriesInteractor = transactionCategoriesInteractor
    }
    
    deinit {
        print("CategoriesScreenVM - was disposed")
    }
    
    // MARK: - Internal
    
    func load() {
        let transactionsCategories = Array(transactionCategoriesInteractor.getAll())
        incomeCategories = transactionsCategories.filter({
            $0.type == .income
        })
        expensesCategories = transactionsCategories.filter({
            $0.type == .expenses
        })
        categoriesLoaded?()
    }
}

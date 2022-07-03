import UIKit

final class CategoriesScreenVC: UIViewController {
    
    // MARK: - Properties
    
    let mainView = CategoriesScreenView()
    private let categoriesScreenVM: CategoriesScreenVM
    
    // MARK: - Lifecycle
    
    init(categoriesScreenVM: CategoriesScreenVM) {
        self.categoriesScreenVM = categoriesScreenVM
        super.init(nibName: nil, bundle: nil)
        self.hidesBottomBarWhenPushed = true
    }
    
    deinit {
        print("CategoriesScreenVC - was disposed")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        self.navigationItem.title = R.string.localizable.categories()
        
        setupCollectionView()
        setupCallbacks()
        
        categoriesScreenVM.load()
    }
    
    // MARK: - Private
    
    private func setupCollectionView() {
        mainView.spendingCollectionView.dataSource = self
        mainView.spendingCollectionView.delegate = self
        mainView.spendingCollectionView.register(TitleViewCell.self, forCellWithReuseIdentifier: TitleViewCell.id)
        
        mainView.incomeCollectionView.dataSource = self
        mainView.incomeCollectionView.delegate = self
        mainView.incomeCollectionView.register(TitleViewCell.self, forCellWithReuseIdentifier: TitleViewCell.id)
    }
    
    private func setupCallbacks() {
        categoriesScreenVM.categoriesLoaded = { [weak self] in
            self?.mainView.incomeCollectionView.reloadData()
            self?.mainView.spendingCollectionView.reloadData()
        }
    }
    
}

extension CategoriesScreenVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if mainView.incomeCollectionView == collectionView {
            return categoriesScreenVM.incomeCategories.count
        } else {
            return categoriesScreenVM.expensesCategories.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleViewCell.id, for: indexPath) as? TitleViewCell
        else {
            return UICollectionViewCell()
        }
        
        var model: TransactionCategoryModel
        if mainView.incomeCollectionView == collectionView {
            model = categoriesScreenVM.incomeCategories[indexPath.item]
        } else {
            model = categoriesScreenVM.expensesCategories[indexPath.item]
        }
        cell.setup(model: model)
        return cell
    }
    
}

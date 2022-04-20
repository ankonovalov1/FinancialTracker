import UIKit

final class CategoriesScreenVC: UIViewController {
    
    // MARK: - Properties
    
    let mainView = CategoriesScreenView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        setupCollectionView()
    }
    
    // MARK: - Private
    
    private func setupCollectionView() {
        mainView.spendingCollectionView.dataSource = self
        mainView.spendingCollectionView.delegate = self
        mainView.spendingCollectionView.register(CategoryViewCell.self, forCellWithReuseIdentifier: CategoryViewCell.id)
        
        mainView.incomeCollectionView.dataSource = self
        mainView.incomeCollectionView.delegate = self
        mainView.incomeCollectionView.register(CategoryViewCell.self, forCellWithReuseIdentifier: CategoryViewCell.id)
    }
    
}

extension CategoriesScreenVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryViewCell.id, for: indexPath) as? CategoryViewCell else { return UICollectionViewCell() }
        return cell
    }
    
}

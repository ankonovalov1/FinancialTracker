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
        mainView.spendingCollectionView.register(TitleViewCell.self, forCellWithReuseIdentifier: TitleViewCell.id)
        
        mainView.incomeCollectionView.dataSource = self
        mainView.incomeCollectionView.delegate = self
        mainView.incomeCollectionView.register(TitleViewCell.self, forCellWithReuseIdentifier: TitleViewCell.id)
    }
    
}

extension CategoriesScreenVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleViewCell.id, for: indexPath) as? TitleViewCell else { return UICollectionViewCell() }
        cell.manageView(backgroundColor: R.color.baseElementsBlue())
        return cell
    }
    
}

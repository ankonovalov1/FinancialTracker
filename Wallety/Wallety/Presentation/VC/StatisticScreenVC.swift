import UIKit

final class StatisticScreenVC: UIViewController {
    
    // MARK: - Properties
    
    let mainView = StatisticScreenView()
    let array = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]
    
    // MARK: - Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view = mainView
        
        mainView.dateCollectionView.delegate = self
        mainView.dateCollectionView.dataSource = self
        mainView.dateCollectionView.register(TitleViewCell.self, forCellWithReuseIdentifier: TitleViewCell.id)
        
        self.tabBarItem.image = UIImage(resource: R.image.chartTabWhite)
        self.tabBarItem.selectedImage = UIImage(resource: R.image.chartTabBlue)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension StatisticScreenVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleViewCell.id, for: indexPath) as? TitleViewCell else { return UICollectionViewCell() }
        cell.manageView()
        cell.nameLabel.font = UIFont(name: "KohinoorGujarati-Regular", size: 14)
        cell.nameLabel.text = array[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? TitleViewCell else { return }
        cell.nameLabel.textColor = R.color.baseElementsBlue()
    }
    
    
}

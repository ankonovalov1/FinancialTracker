import UIKit

final class CategoriesScreenView: UIView {
    
    // MARK: - Views
    
    lazy var incomeLabel: UILabel = {
        let view = UILabel(text: R.string.localizable.income(),
                           font: UIFont(name: "KohinoorGujarati-Regular", size: 16)!,
                           textColor: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var incomeBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = R.color.secondaryBackground()
        return view
    }()
    
    lazy var incomeCollectionView: UICollectionView = {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 12
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    lazy var spendingLabel: UILabel = {
        let view = UILabel(text: R.string.localizable.expenses(),
                           font: UIFont(name: "KohinoorGujarati-Regular", size: 16)!,
                           textColor: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var spendingBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = R.color.secondaryBackground()
        
        return view
    }()
    
    lazy var spendingCollectionView: UICollectionView = {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    lazy var addIncomeButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(resource: R.image.plusGreen), for: .normal)
        view.backgroundColor = R.color.secondaryBackground()
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 6
        view.layer.shadowOpacity = 0.3
        return view
    }()
    
    lazy var addSpendingButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(resource: R.image.plusGreen), for: .normal)
        view.backgroundColor = R.color.secondaryBackground()
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 6
        view.layer.shadowOpacity = 0.3
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        manageView()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Manage views
    
    private func manageView() {
        self.backgroundColor = R.color.primaryBackground()
    }
    
    private func addSubviews() {
        
        incomeBackgroundView.addSubview(incomeCollectionView)
        incomeBackgroundView.addSubview(addIncomeButton)
        
        spendingBackgroundView.addSubview(spendingCollectionView)
        spendingBackgroundView.addSubview(addSpendingButton)
        
        [
            incomeLabel,
            incomeBackgroundView,
            spendingLabel,
            spendingBackgroundView
        ].forEach {
            self.addSubview($0)
        }
    }
    
    // MARK: - Constraints
    
    private func addConstraints() {
        
        incomeLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
            make.left.equalTo(self).offset(35)
        }
        
        incomeBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(incomeLabel.snp.bottom).offset(15)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(200)
        }
        
        spendingLabel.snp.makeConstraints { make in
            make.top.equalTo(incomeBackgroundView.snp.bottom).offset(15)
            make.left.equalTo(self).offset(35)
        }
        
        spendingBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(spendingLabel.snp.bottom).offset(15)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(200)
        }
        
        addIncomeButton.snp.makeConstraints { make in
            make.bottom.equalTo(incomeBackgroundView).offset(-15)
            make.right.equalTo(incomeBackgroundView).offset(-15)
            make.height.width.equalTo(34)
        }
        
        addSpendingButton.snp.makeConstraints { make in
            make.bottom.equalTo(spendingBackgroundView).offset(-15)
            make.right.equalTo(spendingBackgroundView).offset(-15)
            make.height.width.equalTo(34)
        }
        
        incomeCollectionView.snp.makeConstraints { make in
            make.top.left.equalTo(incomeBackgroundView).offset(15)
            make.bottom.right.equalTo(incomeBackgroundView).offset(-15)
        }
        
        spendingCollectionView.snp.makeConstraints { make in
            make.top.left.equalTo(spendingBackgroundView).offset(15)
            make.bottom.right.equalTo(spendingBackgroundView).offset(-15)
        }
        
    }
}

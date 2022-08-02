import UIKit

final class CreateCategoryScreenView: UIView {
    
    // MARK: - Views

    lazy var titleLabel: UILabel = {
        let view = UILabel(text: R.string.localizable.createCategory(),
                           font: CustomFonts.regular(18).roboto,
                           textColor: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        return view
    }()
    
    lazy var imageBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = R.color.secondaryBackground()
        view.layer.defaultShadow()
        return view
    }()
    
    lazy var categoryImageView: CategoryView = {
        let view = CategoryView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 30
        return view
    }()
    
    lazy var colorsChooseLabel: UILabel = {
        let view = UILabel(text: R.string.localizable.chooseColor(),
                           font: CustomFonts.regular(12).roboto,
                           textColor: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        return view
    }()
    
    lazy var colorsBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = R.color.secondaryBackground()
        view.layer.defaultShadow()
        return view
    }()
    
    lazy var colorsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 26, height: 26)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    lazy var categoryNameTextField: WTextField = {
        let view = WTextField()
        view.attributedPlaceholder = NSAttributedString(
            string: R.string.localizable.nameOfCategory(),
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor(white: 1, alpha: 0.5),
                NSAttributedString.Key.font: CustomFonts.light(14).roboto
            ]
        )
        view.textColor = .white
        view.keyboardType = .alphabet
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 12
        view.layer.borderColor = R.color.baseElementsBlue()?.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var maxSymbolInfoLabel: UILabel = {
        let view = UILabel(text: R.string.localizable.maxSymbolsCount(String(35)),
                           font: CustomFonts.regular(12).roboto,
                           textColor: R.color.baseElementsRed()!)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.isHidden = true
        return view
    }()
    
    lazy var iconsChooseLabel: UILabel = {
        let view = UILabel(text: R.string.localizable.chooseIcon(),
                           font: CustomFonts.regular(12).roboto,
                           textColor: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        return view
    }()
    
    lazy var iconsBackView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = R.color.secondaryBackground()
        view.layer.defaultShadow()
        return view
    }()
    
    lazy var iconsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 22, height: 22)
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    lazy var addButton: WButton = {
        let view = WButton(type: .system)
        view.backgroundColor = R.color.baseElementsBlue()
        let title = NSAttributedString(
            string: R.string.localizable.addText(),
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: CustomFonts.light(14).roboto
            ]
        )
        view.setAttributedTitle(title, for: .normal)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isEnabled = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        manageView()
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Manage view
    
    private func manageView() {
        backgroundColor = R.color.primaryBackground()
    }
    
    private func addSubviews() {
        imageBackView.addSubview(categoryImageView)
        colorsBackView.addSubview(colorsCollection)
        iconsBackView.addSubview(iconsCollection)
        [
            titleLabel,
            imageBackView,
            colorsChooseLabel,
            colorsBackView,
            categoryNameTextField,
            maxSymbolInfoLabel,
            iconsChooseLabel,
            iconsBackView,
            addButton
        ].forEach {
            addSubview($0)
        }
        
    }
    
    private func setConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(30)
            make.centerX.equalTo(self)
        }
        
        imageBackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.centerX.equalTo(self)
            make.width.equalTo(150)
            make.height.equalTo(100)
        }
        
        categoryImageView.snp.makeConstraints { make in
            make.centerY.centerX.equalTo(imageBackView)
            make.width.height.equalTo(60)
        }
        
        colorsChooseLabel.snp.makeConstraints { make in
            make.top.equalTo(imageBackView.snp.bottom).offset(30)
            make.left.equalTo(self).offset(35)
        }
        
        colorsBackView.snp.makeConstraints { make in
            make.top.equalTo(colorsChooseLabel.snp.bottom).offset(12)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(40)
        }
        
        colorsCollection.snp.makeConstraints { make in
            make.top.equalTo(colorsBackView).offset(7)
            make.bottom.equalTo(colorsBackView).offset(-7)
            make.left.right.equalTo(colorsBackView)
        }
        
        categoryNameTextField.snp.makeConstraints { make in
            make.top.equalTo(colorsBackView.snp.bottom).offset(12)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(50)
        }
        
        maxSymbolInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(categoryNameTextField.snp.bottom).offset(12)
            make.centerX.equalTo(self)
        }
        
        iconsChooseLabel.snp.makeConstraints { make in
            make.top.equalTo(maxSymbolInfoLabel.snp.bottom).offset(6)
            make.left.equalTo(self).offset(35)
        }
        
        iconsBackView.snp.makeConstraints { make in
            make.top.equalTo(iconsChooseLabel.snp.bottom).offset(12)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.bottom.equalTo(addButton.snp.top).offset(-30)
        }
        
        iconsCollection.snp.makeConstraints { make in
            make.top.equalTo(iconsBackView).offset(10)
            make.bottom.equalTo(iconsBackView).offset(-10)
            make.left.equalTo(colorsBackView).offset(10)
            make.right.equalTo(colorsBackView).offset(-10)
        }
        
        addButton.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(-50)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(50)
        }
    }
}

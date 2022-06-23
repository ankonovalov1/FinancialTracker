import UIKit

final class AddTransactionScreenView: UIView {
    
    // MARK: - Properties
    
    private var isCategoryOpen = false {
        didSet {
            if isCategoryOpen {
                chooseCategoryLabel.isHidden = true
                chooseCategoryValueLabel.isHidden = true
                categoriesCollectionView.isHidden = false
            } else {
                categoryBehindView.isUserInteractionEnabled = true
                chooseCategoryLabel.isHidden = false
                chooseCategoryValueLabel.isHidden = false
                categoriesCollectionView.isHidden = true
            }
        }
    }
    private var isDescriptionOpen = false
    
    // MARK: - Views

    lazy var titleLable: UILabel = {
        let view = UILabel(text: R.string.localizable.addNewNote(),
                           font: CustomFonts.bold(24).roboto,
                           textColor: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var dateLable: UILabel = {
        let view = UILabel(text: String.from(date: Date(), format: "YYYY, MMM d"),
                           font: CustomFonts.regular(14).roboto,
                           textColor: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var transactionTypeSegment: UISegmentedControl = {
        let view = UISegmentedControl(items: [R.string.localizable.income(), R.string.localizable.expenses() ])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = R.color.secondaryBackground()
        view.setTitleTextAttributes(   [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: CustomFonts.regular(12).roboto
        ], for: .normal)
        return view
    }()
    
    lazy var transactionValueTextField: WTextField = {
        let view = WTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.attributedPlaceholder = NSAttributedString(
            string: "0",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor(white: 1, alpha: 0.5),
                NSAttributedString.Key.font: CustomFonts.regular(14).roboto
            ]
        )
        view.backgroundColor = R.color.secondaryBackground()
        view.textColor = .white
        view.keyboardType = .decimalPad
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.layer.borderColor = R.color.baseElementsBlue()?.cgColor
        return view
    }()
    
    lazy var chooseCategoryLabel: UILabel = {
        let view = UILabel(text: R.string.localizable.category(),
                           font: CustomFonts.regular(12).roboto,
                           textColor: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var enterDescriptionLabel: UILabel = {
        let view = UILabel(text: R.string.localizable.description(),
                           font: CustomFonts.regular(12).roboto,
                           textColor: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var chooseCategoryValueLabel: UILabel = {
        let view = UILabel(text: R.string.localizable.categoryNotChosen(),
                           font: CustomFonts.regular(12).roboto,
                           textColor: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var enterDescriptionValueLabel: UILabel = {
        let view = UILabel(text: R.string.localizable.emptyAllSmall(),
                           font: CustomFonts.regular(12).roboto,
                           textColor: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var categoryBehindView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = R.color.secondaryBackground()
        view.layer.cornerRadius = 10
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var descriptionBehindView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = R.color.secondaryBackground()
        view.layer.cornerRadius = 10
        view.isUserInteractionEnabled = true
        return view
    }()
    
    lazy var addButton: WButton = {
        let view = WButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = R.color.baseElementsBlue()
        let title = NSAttributedString(
            string: R.string.localizable.addText(),
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: CustomFonts.regular(14).roboto
            ]
        )
        view.setAttributedTitle(title, for: .normal)
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var categoriesCollectionView: UICollectionView = {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.isHidden = true
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
    
    // MARK: - Update View
    
    func categoryViewTapped() {
        UIView.animate(withDuration: 0.3, delay: 0) {
            if self.isCategoryOpen {
                self.categoryBehindView.snp.remakeConstraints { make in
                    make.top.equalTo(self.transactionValueTextField.snp.bottom).offset(20)
                    make.centerX.equalTo(self)
                    make.left.equalTo(self).offset(35)
                    make.right.equalTo(self).offset(-35)
                    make.height.equalTo(30)
                }
                self.descriptionBehindView.isHidden = false
            } else {
                self.categoryBehindView.snp.remakeConstraints { make in
                    make.top.equalTo(self.transactionValueTextField.snp.bottom).offset(20)
                    make.centerX.equalTo(self)
                    make.left.equalTo(self).offset(35)
                    make.right.equalTo(self).offset(-35)
                    make.bottom.equalTo(self.addButton.snp.top).offset(-20)
                }
                self.descriptionBehindView.isHidden = true
            }
            self.layoutIfNeeded()
        } completion: { _ in
            self.isCategoryOpen.toggle()
        }
    }
    
    func descriptionViewTapped() {
        UIView.animate(withDuration: 0.3, delay: 0) {
            if self.isDescriptionOpen {
                self.descriptionBehindView.snp.remakeConstraints { make in
                    make.top.equalTo(self.categoryBehindView.snp.bottom).offset(10)
                    make.centerX.equalTo(self)
                    make.left.equalTo(self).offset(35)
                    make.right.equalTo(self).offset(-35)
                    make.height.equalTo(30)
                }
                self.categoryBehindView.isHidden = false
            } else {
                self.descriptionBehindView.snp.remakeConstraints { make in
                    make.top.equalTo(self.transactionValueTextField.snp.bottom).offset(20)
                    make.centerX.equalTo(self)
                    make.left.equalTo(self).offset(35)
                    make.right.equalTo(self).offset(-35)
                    make.bottom.equalTo(self.addButton.snp.top).offset(-20)
                }
                self.categoryBehindView.isHidden = true
            }
            self.layoutIfNeeded()
        } completion: { _ in
            self.isDescriptionOpen.toggle()
        }
    }
    
    // MARK: - Manage View
    
    private func manageView() {
        backgroundColor = R.color.primaryBackground()
    }
    
    private func addSubviews() {
        
        [
            chooseCategoryLabel,
            chooseCategoryValueLabel,
            categoriesCollectionView
        ].forEach {
            categoryBehindView.addSubview($0)
        }
        
        [
            enterDescriptionLabel,
            enterDescriptionValueLabel
        ].forEach {
            descriptionBehindView.addSubview($0)
        }
        
        [
            titleLable,
            dateLable,
            transactionTypeSegment,
            transactionValueTextField,
            categoryBehindView,
            descriptionBehindView,
            addButton
        ].forEach {
            addSubview($0)
        }
    }
    
    private func addConstraints() {
        
        titleLable.snp.makeConstraints { make in
            make.top.equalTo(self).offset(24)
            make.centerX.equalTo(self)
        }
        
        dateLable.snp.makeConstraints { make in
            make.top.equalTo(titleLable.snp.bottom).offset(30)
            make.centerX.equalTo(self)
        }
        
        transactionTypeSegment.snp.makeConstraints { make in
            make.top.equalTo(dateLable.snp.bottom).offset(30)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(34)
        }
        
        transactionValueTextField.snp.makeConstraints { make in
            make.top.equalTo(transactionTypeSegment.snp.bottom).offset(20)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(50)
        }
        
        categoryBehindView.snp.makeConstraints { make in
            make.top.equalTo(transactionValueTextField.snp.bottom).offset(20)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(30)
        }
        
        descriptionBehindView.snp.makeConstraints { make in
            make.top.equalTo(categoryBehindView.snp.bottom).offset(10)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(30)
        }
        
        chooseCategoryLabel.snp.makeConstraints { make in
            make.left.equalTo(categoryBehindView).offset(20)
            make.centerY.equalTo(categoryBehindView)
        }
        
        chooseCategoryValueLabel.snp.makeConstraints { make in
            make.right.equalTo(categoryBehindView).offset(-20)
            make.centerY.equalTo(categoryBehindView)
        }
        
        categoriesCollectionView.snp.makeConstraints { make in
            make.top.left.equalTo(categoryBehindView).offset(15)
            make.right.bottom.equalTo(categoryBehindView).offset(-15)
        }
        
        enterDescriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(descriptionBehindView).offset(20)
            make.centerY.equalTo(descriptionBehindView)
        }
        
        enterDescriptionValueLabel.snp.makeConstraints { make in
            make.right.equalTo(descriptionBehindView).offset(-20)
            make.centerY.equalTo(descriptionBehindView)
        }
        
        addButton.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(-50)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(50)
        }
      
    }
    
}

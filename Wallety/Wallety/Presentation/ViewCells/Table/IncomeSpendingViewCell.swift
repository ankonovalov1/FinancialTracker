import UIKit

final class IncomeSpendingViewCell: UITableViewCell {
    
    // MARK: - Properties

    static let id = "IncomeSpendingViewCell"
    
    // MARK: - Views
    
    lazy var categoryImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var typeLabel: UILabel = {
        let view = UILabel(text: "", font: CustomFonts.regular(12).roboto, textColor: .white)
        view.textAlignment = .left
        view.numberOfLines = 1
        view.minimumScaleFactor = 0.5
        return view
    }()
    
    lazy var valueLabel: UILabel = {
        let view = UILabel(text: "", font: CustomFonts.medium(16).roboto, textColor: .white)
        view.textAlignment = .right
        return view
    }()
    
    lazy var dateLabel: UILabel = {
        let view = UILabel(text: "", font: CustomFonts.regular(10).roboto, textColor: .white)
        view.textAlignment = .right
        return view
    }()
    
    lazy var behindView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.secondaryBackground()
        view.layer.cornerRadius = 12
        view.layer.defaultShadow()
        return view
    }()
    
    lazy var stackForLabels: UIStackView = {
        let view = UIStackView(arrangedSubviews: [dateLabel, valueLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.backgroundColor = .clear
        view.spacing = 10
        view.distribution = .fillEqually
        
        return view
    }()
    
    lazy var stackForImageAndLabel: UIStackView = {
        let view = UIStackView(arrangedSubviews: [categoryImage,typeLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.backgroundColor = .clear
        view.spacing = 15
        view.distribution = .fillProportionally
        return view
    }()
    
    // MARK:  - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        manageView()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Internal
    
    func configure(transaction: TransactionModel) {
        categoryImage.image = transaction.category.image
        typeLabel.text = transaction.category.name
        valueLabel.text = transaction.value.formatWith()
        dateLabel.text = String.from(date: transaction.date, format: "YYYY, MMM d")
        switch transaction.type {
        case .expenses:
            valueLabel.textColor = R.color.baseElementsRed()
        case .income:
            valueLabel.textColor = R.color.baseElementsGreen()
        }
    }
    
    // MARK: Private
    
    private func manageView() {
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    private func addSubviews() {
        [
            stackForImageAndLabel,
            stackForLabels
        ].forEach {
            behindView.addSubview($0)
        }
        addSubview(behindView)
    }
    
    private func addConstraints() {
        
        behindView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(self)
        }
        
        stackForImageAndLabel.snp.makeConstraints { make in
            make.left.equalTo(behindView).offset(15)
            make.right.equalTo(stackForLabels.snp.left)
            make.centerY.equalTo(behindView)
            make.height.equalTo(32)
        }
        
        stackForLabels.snp.makeConstraints { make in
            make.right.equalTo(behindView).offset(-15)
            make.centerY.equalTo(behindView)
            make.height.equalTo(40)
            make.width.greaterThanOrEqualTo(110)
        }
        
    }
    
}

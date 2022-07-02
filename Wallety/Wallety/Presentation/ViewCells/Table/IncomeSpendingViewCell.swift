import UIKit

final class IncomeSpendingViewCell: UITableViewCell {
    
    // MARK: - Properties

    static let id = "IncomeSpendingViewCell"
    
    // MARK: - Views
    
    lazy var typeLabel: UILabel = {
        let label = UILabel(text: "", font: CustomFonts.light(8).roboto, textColor: .white)
        label.textAlignment = .center
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel(text: "", font: CustomFonts.light(14).roboto, textColor: .white)
        label.textAlignment = .center
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel(text: "", font: CustomFonts.light(8).roboto, textColor: .white)
        label.textAlignment = .center
        return label
    }()
    
    lazy var behindView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.secondaryBackground()
        view.layer.cornerRadius = 12
        view.layer.defaultShadow()
        return view
    }()
    
    lazy var stackForLabels: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [typeLabel, valueLabel, dateLabel])
        stack.axis = .horizontal
        stack.backgroundColor = .clear
        stack.spacing = 0
        stack.distribution = .fillEqually
        return stack
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
        behindView.addSubview(stackForLabels)
        addSubview(behindView)
    }
    
    private func addConstraints() {
        
        behindView.snp.makeConstraints { make in
            make.top.equalTo(self).offset(5)
            make.left.equalTo(self)
            make.bottom.equalTo(self).offset(-5)
            make.right.equalTo(self)
        }
        
        stackForLabels.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(behindView)
        }
        
    }
    
}

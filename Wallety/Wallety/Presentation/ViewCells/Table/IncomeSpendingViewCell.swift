import UIKit

final class IncomeSpendingViewCell: UITableViewCell {
    
    // MARK: - Properties

    static let id = "IncomeSpendingViewCell"
    
    // MARK: - Views
    
    lazy var typeLabel: UILabel = {
        let label = UILabel(text: "1", font: CustomFonts.light(8).roboto, textColor: .white)
        label.textAlignment = .center
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel(text: "1", font: CustomFonts.light(14).roboto, textColor: .white)
        label.textAlignment = .center
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel(text: "1", font: CustomFonts.light(8).roboto, textColor: .white)
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
    
    func configure(transaction: TransactionVM) {
        typeLabel.text = transaction.kind
        valueLabel.text = transaction.value
        dateLabel.text = transaction.date
        switch transaction.type {
        case .ask:
            valueLabel.textColor = R.color.baseElementsRed()
        case .bid:
            valueLabel.textColor = R.color.baseElementsGreen()
        }
    }
    
    // MARK: Private
    
    private func manageView() {
        backgroundColor = .clear
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

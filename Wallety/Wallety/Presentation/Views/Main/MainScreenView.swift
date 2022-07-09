import UIKit
import SnapKit

final class MainScreenView: UIView {
    
    // MARK: - Views
    
    lazy var currentBalanceLabel: UILabel = {
        let label = UILabel(text: R.string.localizable.currentBalanceCapital(),
                            font: CustomFonts.bold(22).roboto,
                            textColor: .white)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var balanceValueLabel: UILabel = {
        let label = UILabel(text: "", font: CustomFonts.medium(36).roboto, textColor: .white)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stackForPlusMinusButtons: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [increaseBalanceButton, decreaseBalanceButton])
        stack.axis = .horizontal
        stack.spacing = 20
        stack.distribution = .fillEqually
        return stack
    }()
    
    lazy var increaseBalanceButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(resource: R.image.plusGreen), for: .normal)
        button.backgroundColor = R.color.secondaryBackground()
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.defaultShadow()
        return button
    }()
    
    lazy var decreaseBalanceButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(resource: R.image.minusRed), for: .normal)
        button.backgroundColor = R.color.secondaryBackground()
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.defaultShadow()
        return button
    }()
    
    lazy var stackForInfoViews: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [incomeInfoView, spendingInfoView])
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 20
        return stack
    }()
    
    lazy var incomeInfoView: BalanceInfoView = {
        let view = BalanceInfoView(title: R.string.localizable.income(),
                                   value: "230,4 $",
                                   backgroundColor: R.color.baseElementsGreen()!)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var spendingInfoView: BalanceInfoView = {
        let view = BalanceInfoView(title: R.string.localizable.expenses(),
                                   value: "38,2 $",
                                   backgroundColor: R.color.baseElementsRed()!)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = R.color.secondaryBackground()
        return view
    }()
    
    lazy var incomeSpendingLabel: UILabel = {
        let label = UILabel()
        let font = CustomFonts.regular(14).roboto
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = R.string.localizable.incomeAndExpenses()
        label.textColor = .white
        label.font = font
        return label
    }()
    
    lazy var dateStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [dateLabel, calendarImage])
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.spacing = 0
        return view
    }()
    
    lazy var dateLabel: UILabel = {
        let view = UILabel()
        let font = CustomFonts.bold(12).roboto
        view.textAlignment = .right
        view.text = "TODAY"
        view.textColor = R.color.baseElementsBlue()
        view.font = font
        return view
    }()
    
    lazy var calendarImage: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "calendar"))
        view.tintColor = R.color.baseElementsBlue()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var transactionsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(IncomeSpendingViewCell.self, forCellReuseIdentifier: IncomeSpendingViewCell.id)
        return tableView
    }()
    
    lazy var emptyView: NoDataEmptyView = {
        let view = NoDataEmptyView(title: R.string.localizable.noOperations(),
                                   description: R.string.localizable.forThisPeriod())
        view.translatesAutoresizingMaskIntoConstraints = false
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
    
    // MARK: - Internal
    
    func change(state: ViewState) {
        
        switch state {
        case .hasData:
            transactionsTableView.isHidden = false
            emptyView.isHidden = true
        case .loading:
            transactionsTableView.isHidden = true
            emptyView.isHidden = true
        case .empty:
            transactionsTableView.isHidden = true
            emptyView.isHidden = false
        }
        
    }
    
    // MARK: - Private
    
    private func manageView() {
        self.backgroundColor = R.color.primaryBackground()
    }
    
    private func addSubviews() {
        
        [
            currentBalanceLabel,
            balanceValueLabel,
            stackForPlusMinusButtons,
            stackForInfoViews,
            lineView,
            incomeSpendingLabel,
            dateStack,
            transactionsTableView,
            emptyView
        ].forEach {
            self.addSubview($0)
        }
        
    }
    
    private func addConstraints() {
        
        currentBalanceLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(47)
            make.height.equalTo(26)
        }
        
        balanceValueLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(currentBalanceLabel.snp.bottom).offset(3)
            make.height.equalTo(44)
        }
        
        stackForPlusMinusButtons.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(balanceValueLabel.snp.bottom).offset(23)
            make.width.equalTo(127)
            make.height.equalTo(54)
        }
        
        stackForInfoViews.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(stackForPlusMinusButtons.snp.bottom).offset(23)
            make.left.equalTo(self.snp.left).offset(35)
            make.right.equalTo(self.snp.right).offset(-35)
            make.height.equalTo(55)
        }
        
        lineView.snp.makeConstraints { make in
            make.top.equalTo(stackForInfoViews.snp.bottom).offset(22)
            make.left.equalTo(self.snp.left).offset(35)
            make.right.equalTo(self.snp.right).offset(-35)
            make.height.equalTo(1)
        }
        
        incomeSpendingLabel.snp.makeConstraints { make in
            make.top.equalTo(stackForInfoViews.snp.bottom).offset(37)
            make.left.equalTo(self.snp.left).offset(35)
            make.height.equalTo(15)
        }
        
        dateStack.snp.makeConstraints { make in
            make.top.equalTo(stackForInfoViews.snp.bottom).offset(37)
            make.right.equalTo(self.snp.right).offset(-35)
            make.width.equalTo(90)
            make.height.equalTo(15)
        }
        
        transactionsTableView.snp.makeConstraints { make in
            make.top.equalTo(incomeSpendingLabel.snp.bottom).offset(18)
            make.left.equalTo(self.snp.left).offset(35)
            make.bottom.equalTo(self.snp.bottom)
            make.right.equalTo(self.snp.right).offset(-35)
        }
        
        emptyView.snp.makeConstraints { make in
            make.top.equalTo(incomeSpendingLabel).offset(90)
            make.centerX.equalTo(self)
        }
        
    }
    
}

import UIKit
import SnapKit

final class MainScreenView: UIView {
    
    // MARK: - Views
    
    lazy var currentBalanceLabel: UILabel = {
        let label = UILabel(text: R.string.localizable.currentBalance(),
                            font: UIFont(name: "KohinoorGujarati-Regular", size: 14)!,
                            textColor: .white)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var balanceValueLabel: UILabel = {
        let label = UILabel(text: "$3,293.46", font: UIFont(name: "KohinoorGujarati-Regular", size: 40)!, textColor: .white)
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
        return button
    }()
    
    lazy var decreaseBalanceButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(resource: R.image.minusRed), for: .normal)
        button.backgroundColor = R.color.secondaryBackground()
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
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
        let font = UIFont(name: "KohinoorGujarati-Regular", size: 14)!
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = R.string.localizable.incomeAndExpenses()
        label.textColor = .white
        label.font = font
        return label
    }()
    
    lazy var dateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(R.string.localizable.today(), for: .normal)
        button.setTitleColor(R.color.baseElementsBlue(), for: .normal)
        return button
    }()
    
    lazy var infoTableView: UITableView = {
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
            infoTableView.isHidden = false
            emptyView.isHidden = true
        case .loading:
            infoTableView.isHidden = true
            emptyView.isHidden = true
        case .empty:
            infoTableView.isHidden = true
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
            dateButton,
            infoTableView,
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
        
        dateButton.snp.makeConstraints { make in
            make.top.equalTo(stackForInfoViews.snp.bottom).offset(37)
            make.right.equalTo(self.snp.right).offset(-35)
            make.width.equalTo(90)
            make.height.equalTo(15)
        }
        
        infoTableView.snp.makeConstraints { make in
            make.top.equalTo(incomeSpendingLabel.snp.bottom).offset(18)
            make.left.equalTo(self.snp.left).offset(30)
            make.bottom.equalTo(self.snp.bottom)
            make.right.equalTo(self.snp.right).offset(-30)
        }
        
        emptyView.snp.makeConstraints { make in
            make.top.equalTo(incomeSpendingLabel).offset(90)
            make.centerX.equalTo(self)
        }
        
    }
    
}

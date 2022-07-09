import UIKit
import Combine
import SwiftEntryKit

final class MainScreenVC: UIViewController {
    
    // MARK: - Properties
    
    private let mainView = MainScreenView()
    private let mainScreenVM: MainScreenVM
    private let balanceVM: BalanceVM
    private let transactionsVM: TransactionsListVM
    
    private var observables = [AnyCancellable]()
    
    // MARK: - Lifecycle
    
    init(mainScreenVM: MainScreenVM,
         balanceVM: BalanceVM,
         transactionsVM: TransactionsListVM) {
        self.balanceVM = balanceVM
        self.mainScreenVM = mainScreenVM
        self.transactionsVM = transactionsVM
        super.init(nibName: nil, bundle: nil)
        
        configureTabBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        addTargets()
        configureDelegates()
        configureCallbacks()
        
        balanceVM.viewDidLoad()
        transactionsVM.load()
    }
    
    // MARK: - @objc methods
    
    @objc private func switchState() {
        let handler = PopupHandler()
        handler.show(factory: .chooseLanguage)
    }
    
    @objc private func increaseTapped() {
        mainScreenVM.openAddTransaction(with: .income)
    }
    
    @objc private func decreaseTapped() {
        mainScreenVM.openAddTransaction(with: .expenses)
    }
    
    // MARK: - Private
    
    private func configureTabBar() {
        title = R.string.localizable.balance()
        self.tabBarItem.image = UIImage(resource: R.image.walletTabWhite)
        self.tabBarItem.selectedImage = UIImage(resource: R.image.walletTabBlue)
        self.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: CustomFonts.light(10).roboto, NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        self.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: R.color.baseElementsBlue()!], for: .selected)
    }
    
    private func addTargets() {
        mainView.increaseBalanceButton.addTarget(self, action: #selector(increaseTapped), for: .touchUpInside)
        mainView.decreaseBalanceButton.addTarget(self, action: #selector(decreaseTapped), for: .touchUpInside)
    }
    
    private func configureDelegates() {
        mainView.transactionsTableView.delegate = self
        mainView.transactionsTableView.dataSource = self
    }
    
    private func configureCallbacks() {
        
        let obsBalance = balanceVM.$currentBalance.assign(to: \.mainView.balanceValueLabel.text, on: self)
        let obsState = transactionsVM.$transactionsState.sink { [weak self] state in
            switch state {
            case .empty:
                self?.mainView.change(state: .empty)
            case .hasData:
                self?.mainView.change(state: .hasData)
                self?.mainView.transactionsTableView.reloadData()
            }
        }
        observables.append(contentsOf: [obsBalance, obsState])
    }
    
}

extension MainScreenVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactionsVM.transactions.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IncomeSpendingViewCell.id, for: indexPath) as! IncomeSpendingViewCell
        let transaction = transactionsVM.transactions[indexPath.item]
        cell.configure(transaction: transaction)
        return cell
    }
    
}

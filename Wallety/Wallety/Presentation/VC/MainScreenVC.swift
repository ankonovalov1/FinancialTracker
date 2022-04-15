import UIKit
import SwiftEntryKit

final class MainScreenVC: UIViewController {
    
    // MARK: - Properties
    
    let mainView = MainScreenView()
    let viewModel = MainScreenVM()
    
    // MARK: - Lifecycle
    
    init() {
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
    }
    
    // MARK: - @objc methods
    
    @objc private func openPopup() {
        let view = ChoicePopup(frame: CGRect(x: 0, y: 0, width: 200, height: 220))
        var attr = EKAttributes()
        attr.position = .center
        attr.displayDuration = .infinity
        attr.entryBackground = .visualEffect(style: .standard)
        SwiftEntryKit.display(entry: view, using: attr)
    }
    
    // MARK: - Private
    
    private func configureTabBar() {
        self.tabBarItem.image = UIImage(resource: R.image.walletTabWhite)
        self.tabBarItem.selectedImage = UIImage(resource: R.image.walletTabBlue)
    }
    
    private func addTargets() {
        mainView.increaseBalanceButton.addTarget(self, action: #selector(openPopup), for: .touchUpInside)
    }
    
    private func configureDelegates() {
        mainView.infoTableView.delegate = self
        mainView.infoTableView.dataSource = self
    }
    
}

extension MainScreenVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.transactions.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IncomeSpendingViewCell.id, for: indexPath) as! IncomeSpendingViewCell
        cell.selectionStyle = .none
        cell.configure(transaction: viewModel.transactions[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.frame.size.height += 20
    }
    
}

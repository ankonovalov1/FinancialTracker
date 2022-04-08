import UIKit

final class MainScreenVC: UIViewController {
    
    // MARK: - Properties
    
    let mainView = MainScreenView()
    let viewModel = MainScreenVM()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        
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
        cell.configure(transaction: viewModel.transactions[indexPath.row])
        return cell
    }
    
}

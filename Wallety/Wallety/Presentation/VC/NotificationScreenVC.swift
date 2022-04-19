import UIKit

final class NotificationScreenVC: UIViewController {
    
    // MARK: - Properties
    
    let mainView = NotificationScreenView()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        setupTableView()
        addTargets()
    }
    
    // MARK: - @objc
    
    @objc private func switchState() {
        if mainView.notificationSwitcher.isOn {
            mainView.change(state: .hasData)
        }
        else {
            mainView.change(state: .empty)
        }
    }
    
    // MARK: - Private
    
    private func setupTableView() {
        mainView.notificationTableView.register(NotificationViewCell.self, forCellReuseIdentifier: NotificationViewCell.id)
        mainView.notificationTableView.delegate = self
        mainView.notificationTableView.dataSource = self
    }
    
    private func addTargets() {
        mainView.notificationSwitcher.addTarget(self, action: #selector(switchState), for: .valueChanged)
    }

}

extension NotificationScreenVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        return view
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NotificationViewCell.id, for: indexPath) as? NotificationViewCell else { return UITableViewCell() }
        return cell
    }
    
    
}

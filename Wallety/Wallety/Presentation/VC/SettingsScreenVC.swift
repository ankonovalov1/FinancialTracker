import UIKit

final class SettingsScreenVC: UIViewController {
    
    // MARK: - Lifecycle
    
    let mainView = SettingsScreenView()
    
    // MARK: - Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
        configureTabBar()
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
    }
    
    // MARK: - Private
    
    private func configureTabBar() {
        self.tabBarItem.image = UIImage(resource: R.image.settingsTabWhite)
        self.tabBarItem.selectedImage = UIImage(resource: R.image.settingsTabBlue)
    }
    
    private func configureTableView() {
        mainView.tableView.register(SettingsViewCell.self, forCellReuseIdentifier: SettingsViewCell.id)
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }

}

extension SettingsScreenVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 26
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsViewCell.id, for: indexPath)
        return cell
    }
    
}

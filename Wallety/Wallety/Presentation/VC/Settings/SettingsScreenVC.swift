import UIKit

final class SettingsScreenVC: UIViewController {
    
    // MARK: - Lifecycle
    
    let mainView = SettingsScreenView()
    let viewModel = SettingsScreenVM()
    
    // MARK: - Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
        configureTabBar()
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("SettingsScreenVC - was disposed")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        self.navigationItem.backButtonTitle = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
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
        
        mainView.tableView.separatorStyle = .singleLine
        mainView.tableView.separatorColor = R.color.primaryBackground()
        mainView.tableView.separatorInset = UIEdgeInsets(top: 0, left: 70, bottom: 0, right: 0)
    }

}

extension SettingsScreenVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data[section].settings.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 26
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsViewCell.id, for: indexPath) as? SettingsViewCell else { return UITableViewCell() }
        
        let models = viewModel.data[indexPath.section]
        cell.setup(model: models.settings[indexPath.row])
        cell.navigate = { cellType in
            if cellType == .about {
                self.navigationController?.pushViewController(AboutScreenVC(), animated: true)
            }
            else if cellType == .policy {
                self.navigationController?.pushViewController(PrivacyPolicyVC(), animated: true)
            }
            else if cellType == .mark {
                guard let url = URL(string: "https://www.apple.com/app-store/")
                else { return }
                UIApplication.shared.open(url)
            }
            else if cellType == .notification {
                self.navigationController?.pushViewController(NotificationScreenVC(), animated: true)
            }
            else if cellType == .categories {
                self.navigationController?.pushViewController(CategoriesScreenVC(), animated: true)
            }
        }
        return cell
    }
    
}

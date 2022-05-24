import UIKit

final class PrivacyPoliceVC: UIViewController {
    
    // MARK: - Properties
    
    let mainView = PrivacyPoliceView()
    
    // MARK: - Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("PrivacyPoliceVC - was desposed")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        self.navigationItem.title = "Политика конфиденциальности"
        self.navigationController?.navigationBar.isOpaque = true
        loadContent()
    }
    
    // MARK: - Private
    
    private func loadContent() {
        let loader = ContentLoader()
        let content = loader.loadFrom(name: "privacy-policy", exten: "txt")
        mainView.policyTextField.text = content
    }
    
}

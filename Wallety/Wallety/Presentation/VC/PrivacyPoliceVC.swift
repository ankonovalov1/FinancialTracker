import UIKit

final class PrivacyPoliceVC: UIViewController {
    
    // MARK: - Properties
    
    let mainView = PrivacyPoliceView()
    
    // MARK: - Lifecycle
    
    deinit {
        print("PrivacyPoliceVC - was desposed")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        loadContent()
    }
    
    // MARK: - Private
    
    private func loadContent() {
        let loader = ContentLoader()
        let content = loader.loadFrom(name: "privacy-policy", exten: "txt")
        mainView.policyTextField.text = content
    }
    
}

import UIKit

final class AboutScreenVC: UIViewController {
    
    // MARK: - Properties
    
    let mainView = AboutScreenView()
    
    // MARK: - Lifecycle
    
    deinit {
        print("AboutScreenVC - was desposed")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
    }
    
}

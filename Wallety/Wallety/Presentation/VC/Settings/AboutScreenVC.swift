import UIKit

final class AboutScreenVC: UIViewController {
    
    // MARK: - Properties
    
    let mainView = AboutScreenView()
    
    // MARK: - Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.hidesBottomBarWhenPushed = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("AboutScreenVC - was desposed")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        self.navigationItem.title = "О приложении"
    }
    
}

import UIKit

final class ProfileScreenVC: UIViewController {
    
    // MARK: - Properties
    
    let mainView = ProfileScreenView()
    
    // MARK: - Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem.image = UIImage(resource: R.image.profileTabWhite)
        self.tabBarItem.selectedImage = UIImage(resource: R.image.profileTabBlue)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
    }

}

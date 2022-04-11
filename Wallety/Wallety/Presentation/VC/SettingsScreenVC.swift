import UIKit

final class SettingsScreenVC: UIViewController {
    
    // MARK: - Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem.image = UIImage(resource: R.image.settingsTabWhite)
        self.tabBarItem.selectedImage = UIImage(resource: R.image.settingsTabBlue)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

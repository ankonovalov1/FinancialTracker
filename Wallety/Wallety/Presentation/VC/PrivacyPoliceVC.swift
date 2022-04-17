import UIKit

final class PrivacyPoliceVC: UIViewController {
    
    let mainView = PrivacyPoliceView()
    
    deinit {
        print("PrivacyPoliceVC - was desposed")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
    }
    

}

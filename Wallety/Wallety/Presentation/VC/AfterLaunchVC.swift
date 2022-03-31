import UIKit

class AfterLaunchVC: UIViewController {
    
    let mainView = AfterLaunchView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
    }

}


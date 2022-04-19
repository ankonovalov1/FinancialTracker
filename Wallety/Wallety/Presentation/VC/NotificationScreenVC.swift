import UIKit

final class NotificationScreenVC: UIViewController {
    
    let mainView = NotificationScreenView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
    }

}

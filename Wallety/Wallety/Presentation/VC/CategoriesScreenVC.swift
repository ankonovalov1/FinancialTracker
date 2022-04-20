import UIKit

final class CategoriesScreenVC: UIViewController {
    
    let mainView = CategoriesScreenView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
    }
    
}

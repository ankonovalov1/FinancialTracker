import UIKit

final class ProfileScreenVC: UIViewController {
    
    // MARK: - Properties
    
    let mainView = ProfileScreenView()
    let viewModel = ProfileScreenVM()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        configure()
    }
    
    private func configure() {
        mainView.nicknameTextField.text = viewModel.model.nickname
        mainView.emailTextField.text = viewModel.model.email
        mainView.balanceTextField.text = String(viewModel.model.account.balance)
        mainView.dutyTextField.text = String(viewModel.model.account.duty)
        mainView.investmentTextField.text = String(viewModel.model.account.investment)
    }

}

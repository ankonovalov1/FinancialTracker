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
        mainView.emailTextField.delegate = self
        mainView.nicknameTextField.delegate = self
        mainView.changeButton.addTarget(self, action: #selector(changeEditingMode), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureValues()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    // MARK: - Private
    
    private func configureValues() {
        mainView.nicknameTextField.text = viewModel.model.nickname
        mainView.emailTextField.text = viewModel.model.email
        mainView.balanceValueLabel.text = String(viewModel.model.account.balance)
        mainView.dutyValueLabel.text = String(viewModel.model.account.duty)
        mainView.investmentValueLabel.text = String(viewModel.model.account.investment)
    }
    
    @objc private func changeEditingMode() {
        if viewModel.isEditing {
            mainView.enableEditing(false)
        }
        else {
            mainView.enableEditing(true)
        }
        viewModel.isEditing.toggle()
    }

}

extension ProfileScreenVC: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
    }
    
}

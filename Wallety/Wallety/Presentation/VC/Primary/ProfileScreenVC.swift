import UIKit

final class ProfileScreenVC: UIViewController {
    
    // MARK: - Properties
    
    let mainView = ProfileScreenView()
    let viewModel = ProfileScreenVM()
    var imagePicker: ImagePickerProtocol = ImagePickerHandler()
    
    // MARK: - Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupTabBar()
        imagePicker.presenter = self
        setDelegates()
        setTargets()
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
    
    private func setupTabBar() {
        self.tabBarItem.image = UIImage(resource: R.image.profileTabWhite)
        self.tabBarItem.selectedImage = UIImage(resource: R.image.profileTabBlue)
        self.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: CustomFonts.light(10).roboto, NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        self.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: R.color.baseElementsBlue()!], for: .highlighted)
        title = R.string.localizable.profile()
    }
    
    private func setDelegates() {
        mainView.emailTextField.delegate = self
        mainView.nicknameTextField.delegate = self
    }
    
    private func setTargets() {
        mainView.changeButton.addTarget(self, action: #selector(changeEditingMode), for: .touchUpInside)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        mainView.profileLogo.addGestureRecognizer(gesture)
        mainView.profileLogo.isUserInteractionEnabled = true
    }
    
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
    
    @objc private func chooseImage() {
        imagePicker.didSelect = { [weak self] image in
            guard let image = image else { return }
            self?.mainView.profileLogo.image = image
        }
        imagePicker.present()
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

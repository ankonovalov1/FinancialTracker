import UIKit

final class StartBalanceScreenVC: UIViewController {
    
    // MARK: Properties
    
    private let mainView = StartBalanceView()
    private let viewModel: StartBalanceVM
    
    // MARK: VC lifecycle
    
    init(viewModel: StartBalanceVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        print("StartBalanceScreenVC - was disposed")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        addTargets()
        addObservers()
        configureSubviews()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeObservers()
    }
    
    // MARK: @objc func
    
    @objc private func skipTapped() {
        viewModel.setBalanceSkipped()
    }
    
    @objc private func setBalanceTapped() {
        viewModel.currentBalance = mainView.balanceTextField.text ?? ""
        viewModel.setBalance()
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        if view.frame.origin.y == 0 {
            mainView.updateHeight(height: keyboardSize.height, toNormal: false)
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        mainView.updateHeight(height: 0, toNormal: true)
    }
    // MARK: Private functions
    
    private func addTargets() {
        mainView.setButton.addTarget(self, action: #selector(setBalanceTapped), for: .touchUpInside)
        mainView.skipButton.addTarget(self, action: #selector(skipTapped), for: .touchUpInside)
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: self.view.window)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: self.view.window)
    }
    
    private func removeObservers() {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func configureSubviews() {
        
        mainView.setButton.isEnabled = !viewModel.isBalanceEmpty
        viewModel.balanceChanged = { [weak self] isEmpty in
            self?.mainView.setButton.isEnabled = !isEmpty
        }
        
        mainView.balanceTextField.delegate = self
    }
    
}

extension StartBalanceScreenVC: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let isEmpty = textField.text?.isEmpty else { return }
        viewModel.isBalanceEmpty = isEmpty
    }
    
}


import UIKit

final class AfterLaunchVC: UIViewController {
    
    // MARK: Properties
    
    private let mainView = AfterLaunchView()
    private let viewModel = AfterLaunchVM()
    private let navigator: NavigatorProtocol
    
    // MARK: VC lifecycle
    
    init(navigator: NavigatorProtocol) {
        self.navigator = navigator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        addTargets()
        configureSubviews()
    }
    
    // MARK: @objc func
    
    @objc private func skipTapped() {
        
    }
    
    @objc private func setBalanceTapped() {
        navigator.navigate(to: .mainTabScreen)
    }
    
    // MARK: Private func
    
    private func addTargets() {
        mainView.setButton.addTarget(self, action: #selector(setBalanceTapped), for: .touchUpInside)
        mainView.skipButton.addTarget(self, action: #selector(skipTapped), for: .touchUpInside)
    }
    
    private func configureSubviews() {
        
        mainView.setButton.isEnabled = !viewModel.isBalanceEmpty
        viewModel.balanceChanged = { [weak self] isEmpty in
            self?.mainView.setButton.isEnabled = !isEmpty
        }
        
        mainView.balanceTextField.delegate = self
    }

}

extension AfterLaunchVC: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let isEmpty = textField.text?.isEmpty else { return }
        viewModel.isBalanceEmpty = isEmpty
    }
    
}


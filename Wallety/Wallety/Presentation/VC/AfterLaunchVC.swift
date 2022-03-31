import UIKit

final class AfterLaunchVC: UIViewController {
    
    // MARK: Properties
    
    let mainView = AfterLaunchView()
    let viewModel = AfterLaunchVM()
    
    // MARK: VC lifecycle

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


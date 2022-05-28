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
        configureSubviews()
    }
    
    // MARK: @objc func
    
    @objc private func skipTapped() {
        viewModel.setBalanceSkipped()
    }
    
    @objc private func setBalanceTapped() {
        viewModel.setBalance()
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

extension StartBalanceScreenVC: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let isEmpty = textField.text?.isEmpty else { return }
        viewModel.isBalanceEmpty = isEmpty
    }
    
}


import UIKit

final class StartCurrencyScreenVC: UIViewController {
    
    // MARK: - Properties
    
    let mainView = StartCurrencyView()
    let navigator: NavigatorProtocol
    
    // MARK: - Lifecycle
    
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
    }
    
    // MARK: - @objc
    
    @objc private func currencyChanged() {
        // TODO: some logic when switch currency
    }
    
    @objc private func setCurrency() {
        navigator.navigate(to: .setBalance)
    }
    
    // MARK: - Private
    
    private func addTargets() {
        mainView.currencySegment.addTarget(self, action: #selector(currencyChanged), for: .valueChanged)
        mainView.setButton.addTarget(self, action: #selector(setCurrency), for: .touchUpInside)
    }
    
}

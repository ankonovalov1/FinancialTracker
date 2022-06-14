import UIKit

final class StartCurrencyScreenVC: UIViewController {
    
    // MARK: - Properties
    
    private let mainView = StartCurrencyView()
    private let viewModel: StartCurrencyScreenVM
    
    // MARK: - Lifecycle
    
    init(viewModel: StartCurrencyScreenVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        addTargets()
        setCurrentSegment()
    }
    
    // MARK: - @objc
    
    @objc private func currencyChanged() {
        setCurrentSegment()
    }
    
    @objc private func setCurrencyTapped() {
        viewModel.setCurrency()
        viewModel.showSetBalanceScreen()
    }
    
    // MARK: - Private
    
    private func addTargets() {
        mainView.currencySegment.addTarget(self, action: #selector(currencyChanged), for: .valueChanged)
        mainView.setButton.addTarget(self, action: #selector(setCurrencyTapped), for: .touchUpInside)
    }
    
    private func setCurrentSegment() {
        let index = mainView.currencySegment.selectedSegmentIndex
        guard let title = mainView.currencySegment.titleForSegment(at: index) else {
            return
        }
        switch title {
        case R.string.localizable.ruble():
            viewModel.currency = .init(type: .ruble)
        case R.string.localizable.euro():
            viewModel.currency = .init(type: .euro)
        case R.string.localizable.dollar():
            viewModel.currency = .init(type: .dollar)
        default:
            viewModel.currency = .init(type: .dollar)
        }
    }
    
}

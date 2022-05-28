import UIKit

final class SplashScreenVC: UIViewController {
    
    // MARK: Properties
    
    private let mainView = SplashScreenView()
    private let viewModel: SplashScreenVM
    
    // MARK: - Lifecycle
    
    init(viewModel: SplashScreenVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        print("SplashScreenVC - was disposed")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear()
    }
    
}

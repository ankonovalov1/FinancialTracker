import UIKit

final class SplashScreenVC: UIViewController {
    
    // MARK: Properties
    
    private let mainView = SplashScreenView()
    private let navigator: NavigatorProtocol
    
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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            if UserDefaults.standard.bool(forKey: StringKeys.skipAfterLaunch) {
                self.navigator.navigate(to: .mainTabScreen)
            }
            else {
                self.navigator.navigate(to: .setCurrency)
            }
        }
    }

}

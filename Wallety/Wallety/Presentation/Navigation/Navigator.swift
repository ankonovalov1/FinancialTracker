import Foundation
import UIKit

protocol NavigatorProtocol {
    var navigationController: UINavigationController? { get }
    var factory: RouterFactoryProtocol { get }
}

extension NavigatorProtocol {
    
    func navigate(to destination: Destination) {
        setTransitionStyle(interval: 0.3, timingFunc: CAMediaTimingFunction(name: .easeOut), type: .fade)
        let vc = createVC(from: destination)
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    func setTransitionStyle(interval: CFTimeInterval, timingFunc: CAMediaTimingFunction, type: CATransitionType) {
        let animation = CATransition()
        animation.duration = interval
        animation.timingFunction = timingFunc
        animation.type = type
        navigationController?.view.layer.add(animation, forKey: nil)
    }
    
    func createVC(from destination: Destination) -> UIViewController {
        let router = factory.createRouter(for: destination)
        return router.configure()
    }
    
}

final class Navigator: NavigatorProtocol {
    
    weak var navigationController: UINavigationController?
    var factory: RouterFactoryProtocol
    
    init(navigationController: UINavigationController, factory: RouterFactoryProtocol) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
}

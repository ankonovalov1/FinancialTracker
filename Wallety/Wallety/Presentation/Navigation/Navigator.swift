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
    
    func present(_ destination: Destination, params: [String: Any]? = nil) {
        let vc = createVC(from: destination)
        if let params = params {
            vc.setViewModel(params: params)
        }
        navigationController?.present(vc, animated: true)
    }
    
    func push(_ destination: Destination, params: [String: Any]? = nil, from: UINavigationController? = nil) {
        let vc = createVC(from: destination)
        if let params = params {
            vc.setViewModel(params: params)
        }
        if let from = from {
            from.pushViewController(vc, animated: true)
        } else {
            navigationController?.pushViewController(vc, animated: true)
        }
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

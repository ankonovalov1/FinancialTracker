import UIKit

extension CALayer {
    
    func defaultShadow() {
        self.shadowColor = UIColor.black.cgColor
        self.shadowRadius = 4
        self.shadowOffset = CGSize(width: 0, height: 4)
        self.shadowOpacity = 0.25
    }
}

extension UIViewController {
    
    @objc func setViewModel(params: [String:Any]) {}
}

import UIKit

class WButton: UIButton {

    override var isEnabled: Bool {
        didSet {
            animateBackground(enabled: isEnabled)
        }
    }
    
    private func animateBackground(enabled: Bool) {
        if enabled {
            UIView.animate(withDuration: 0.5) {
                self.backgroundColor =  self.backgroundColor?.withAlphaComponent(1)
            }
        }
        else {
            UIView.animate(withDuration: 0.2) {
                self.backgroundColor =  self.backgroundColor?.withAlphaComponent(0.3)
            }
        }
    }

}

import Foundation
import UIKit

protocol PopupFactoryProtocol {
    func createPopup() -> UIView
}

enum PopupFactory: PopupFactoryProtocol {
    
    case chooseTheme
    case chooseLanguage
    
    func createPopup() -> UIView {
        switch self {
        case .chooseTheme:
            return ChoicePopup()
        case .chooseLanguage:
            return ChoicePopup()
        }
    }
    
}

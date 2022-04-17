import Foundation
import UIKit

enum PopupFactory {
    
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

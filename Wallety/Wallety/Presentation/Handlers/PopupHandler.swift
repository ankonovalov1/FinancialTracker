import Foundation
import SwiftEntryKit

final class PopupHandler {
    
    func show(factory: PopupFactory) {
        let view = factory.createPopup()
        var attr = EKAttributes()
        attr.position = .center
        attr.displayDuration = .infinity
        attr.entryBackground = .visualEffect(style: .standard)
        SwiftEntryKit.display(entry: view, using: attr)
    }
    
}

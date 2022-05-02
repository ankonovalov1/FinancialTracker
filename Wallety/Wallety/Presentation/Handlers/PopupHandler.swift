import Foundation
import SwiftEntryKit

final class PopupHandler {
    
    func show(factory: PopupFactory) {
        let view = factory.createPopup()
        var attr = EKAttributes()
        attr.position = .center
        attr.entryInteraction = .absorbTouches
        attr.screenBackground = .visualEffect(style: .dark)
        attr.screenInteraction = .dismiss
        attr.displayDuration = .infinity
        attr.positionConstraints.size.height = EKAttributes.PositionConstraints.Edge.constant(value: 220)
        attr.positionConstraints.size.width = EKAttributes.PositionConstraints.Edge.constant(value: 200)
        attr.entranceAnimation = .init(translate: nil, scale: .init(from: 0, to: 1, duration: 0.3), fade: nil)
        attr.exitAnimation = .init(translate: nil, scale: .init(from: 1, to: 0, duration: 0.3), fade: nil)
        SwiftEntryKit.display(entry: view, using: attr)
    }
    
}

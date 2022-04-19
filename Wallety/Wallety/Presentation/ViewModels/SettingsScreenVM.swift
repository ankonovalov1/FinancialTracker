import Foundation
import UIKit

struct SettingsScreenVM {
    
    let data: [SettingVM]
    
    init() {
        data = [
            .init(title: "Styling", settings: [
                .init(image: UIImage(resource: R.image.themeBrushWhite)!, cellType: .theme),
                .init(image: UIImage(resource: R.image.dollarSquareWhite)!, cellType: .currency)
            ]),
            .init(title: "Settings", settings: [
                .init(image: UIImage(resource: R.image.notificationRingWhite)!, cellType: .notification),
                .init(image: UIImage(resource: R.image.searchCategoryWhite)!, cellType: .categories)
            ]),
            .init(title: "Additional", settings: [
                .init(image: UIImage(resource: R.image.likeDislikeWhite)!, cellType: .mark),
                .init(image: UIImage(resource: R.image.shielPrivacyWhite)!, cellType: .policy),
                .init(image: UIImage(resource: R.image.aboutInfoWhite)!, cellType: .about)
            ])
        ]
    }
    
}

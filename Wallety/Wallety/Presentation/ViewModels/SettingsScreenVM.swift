import Foundation
import UIKit

struct SettingsScreenVM {
    
    let data: [SettingVM]
    
    init() {
        data = [
            .init(title: "Styling", settings: [
                .init(image: UIImage(resource: R.image.themeBrushWhite)!, title: "Тема"),
                .init(image: UIImage(resource: R.image.dollarSquareWhite)!, title: "Валюта")
            ]),
            .init(title: "Settings", settings: [
                .init(image: UIImage(resource: R.image.notificationRingWhite)!, title: "Нотификации"),
                .init(image: UIImage(resource: R.image.searchCategoryWhite)!, title: "Категории")
            ]),
            .init(title: "Additional", settings: [
                .init(image: UIImage(resource: R.image.likeDislikeWhite)!, title: "Оценить приложение"),
                .init(image: UIImage(resource: R.image.shielPrivacyWhite)!, title: "Политика конфиденциальности"),
                .init(image: UIImage(resource: R.image.aboutInfoWhite)!, title: "О приложении")
            ])
        ]
    }
    
}

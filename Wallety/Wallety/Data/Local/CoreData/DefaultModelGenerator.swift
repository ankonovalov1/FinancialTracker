import UIKit

final class DefaultModelGenerator {
    
    static func generateDefaultCategories() -> Set<TransactionCategoryModel> {
        return [
            // Incomes
            .init(id: UUID().uuidString,
                  name: R.string.localizable.salaryCategory(),
                  type: .income,
                  image: nil),
            .init(id: UUID().uuidString,
                  name: R.string.localizable.rentCategory(),
                  type: .income,
                  image: nil),
            .init(id: UUID().uuidString,
                  name: R.string.localizable.savingsCategory(),
                  type: .income,
                  image: nil),
            // Expenses
            .init(id: UUID().uuidString,
                  name: R.string.localizable.transportCategory(),
                  type: .expenses,
                  image: nil),
            .init(id: UUID().uuidString,
                  name: R.string.localizable.taxiCategory(),
                  type: .expenses,
                  image: nil),
            .init(id: UUID().uuidString,
                  name: R.string.localizable.hobbyCategory(),
                  type: .expenses,
                  image: nil),
            .init(id: UUID().uuidString,
                  name: R.string.localizable.internetCategory(),
                  type: .expenses,
                  image: nil),
            .init(id: UUID().uuidString,
                  name: R.string.localizable.entertainmentCategory(),
                  type: .expenses,
                  image: nil),
            .init(id: UUID().uuidString,
                  name: R.string.localizable.cafeCategory(),
                  type: .expenses,
                  image: nil),
            .init(id: UUID().uuidString,
                  name: R.string.localizable.carCategory(),
                  type: .expenses,
                  image: nil),
            .init(id: UUID().uuidString,
                  name: R.string.localizable.presentsCategory(),
                  type: .expenses,
                  image: nil),
            .init(id: UUID().uuidString,
                  name: R.string.localizable.petsCategory(),
                  type: .expenses,
                  image: nil),
            .init(id: UUID().uuidString,
                  name: R.string.localizable.clothingCategory(),
                  type: .expenses,
                  image: nil),
            .init(id: UUID().uuidString,
                  name: R.string.localizable.healthCategory(),
                  type: .expenses,
                  image: nil),
            .init(id: UUID().uuidString,
                  name: R.string.localizable.houseCategory(),
                  type: .expenses,
                  image: nil),
            .init(id: UUID().uuidString,
                  name: R.string.localizable.foodCategory(),
                  type: .expenses,
                  image: nil),
            .init(id: UUID().uuidString,
                  name: R.string.localizable.beautyAndHygieneCategory(),
                  type: .expenses,
                  image: nil)
        ]
    }
    
    static func generateSettingsVM() -> [SettingVM] {
        return [
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

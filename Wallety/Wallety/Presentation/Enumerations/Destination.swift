import Foundation

enum Destination {
    
    // Main transitions
    case splash
    case setCurrency
    case setBalance
    case main
    case mainTabScreen

}

enum SettingCellType: String {
    case theme = "Тема"
    case currency = "Валюта"
    case notification = "Нотификации"
    case categories = "Категории"
    case mark = "Оценить приложение"
    case policy = "Политика конфиденциальности"
    case about = "О приложении"
    case none = ""
}


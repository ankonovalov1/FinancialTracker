import Foundation

final class ProfileScreenVM {
    
    var model: ProfileModel
    var isEditing: Bool = false
    
    init() {
        model = ProfileModel(account: Account())
    }
    
}

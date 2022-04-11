import Foundation

final class ProfileScreenVM {
    
    var model: ProfileModel
    
    init() {
        model = ProfileModel(account: Account())
    }
    
}

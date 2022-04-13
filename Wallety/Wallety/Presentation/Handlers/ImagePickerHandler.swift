import Foundation
import UIKit

protocol ImagePickerProtocol {
    
    var didSelect: ((UIImage?) -> ())? { get set }
    var presenter: UIViewController? { get set }
    
    func present()
}

final class ImagePickerHandler: NSObject, ImagePickerProtocol {
    
    var didSelect: ((UIImage?) -> ())?
    weak var presenter: UIViewController?
    let pickerController = UIImagePickerController()
    
    override init() {
        super.init()
        pickerController.delegate = self
        pickerController.allowsEditing = false
        pickerController.mediaTypes = ["public.image"]
    }
    
    func present() {
        presenter?.present(pickerController, animated: true)
    }
    
}

extension ImagePickerHandler: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage
        else {
            didSelect?(nil)
            return
        }
        didSelect?(image)
    }
    
}

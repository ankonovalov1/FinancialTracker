import Combine
import Foundation
import UIKit

final class CreateCategoryScreenVM: ObservableObject {
    
    // MARK: - Properties
    
    var colors = [ColorViewModel]()
    var categoryImages = [CategoryImageViewModel]()
    
    @Published var currentColor: UIColor = .clear
    @Published var currentImage: UIImage = UIImage(systemName: "questionmark")!.withTintColor(.white, renderingMode: .alwaysOriginal)
    
    // MARK: - Lifecycle
    
    init() {
        setColors()
        setImages()
    }
    
    deinit {
        print("CreateCategoryScreenVM - was disposed")
    }
    
    // MARK: - Internal
    
    func selectColor(at index: Int) {
        let color = colors[index].color
        currentColor = color
    }
    
    func selectImage(at index: Int) {
        let image = categoryImages[index].image
        currentImage = image
    }
    
    private func setColors() {
        colors = SFColors.all.map { color in
            return ColorViewModel(color: color)
        }
        if let newColor = colors.first?.color {
            currentColor = newColor
        }
    }
    
    private func setImages() {
        categoryImages = SFSymbols.names.compactMap { name in
            if let image = UIImage(systemName: name)?.withTintColor(.white, renderingMode: .alwaysOriginal) {
                return CategoryImageViewModel(image: image)
            }
            return nil
        }
        if let newImage = categoryImages.first?.image {
            currentImage = newImage
        }
    }
    
}

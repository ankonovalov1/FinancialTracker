import Combine
import UIKit

final class CreateCategoryVC: UIViewController {
    
    private let mainView = CreateCategoryScreenView()
    private let createCategoryVM = CreateCategoryScreenVM()
    
    private var cancellableStore = Set<AnyCancellable>()
    
//    init(createCategoryVM: CreateCategoryScreenVM) {
//        self.createCategoryVM = createCategoryVM
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        setDelegates()
        setBindings()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func setDelegates() {
        mainView.categoryNameTextField.delegate = self
        
        mainView.colorsCollection.delegate = self
        mainView.colorsCollection.dataSource = self
        mainView.colorsCollection.register(SimpleCircleViewCell.self, forCellWithReuseIdentifier: SimpleCircleViewCell.id)
        
        mainView.iconsCollection.delegate = self
        mainView.iconsCollection.dataSource = self
        mainView.iconsCollection.register(ImageViewCell.self, forCellWithReuseIdentifier: ImageViewCell.id)
    }
    
    private func setBindings() {
        
        createCategoryVM.$currentColor.sink { [weak self] color in
            self?.mainView.categoryImageView.update(color: color)
        }.store(in: &cancellableStore)
        
        createCategoryVM.$currentImage.sink { [weak self] image in
            self?.mainView.categoryImageView.update(image: image)
        }.store(in: &cancellableStore)
    }
    
    private func maxCharacterLabel(hide: Bool) {
        if  mainView.maxSymbolInfoLabel.isHidden == hide {
            return
        } else {
            mainView.maxSymbolInfoLabel.isHidden = hide
        }
    }

}

extension CreateCategoryVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text {
            
            if text.count == 35 {
                if string.isEmpty {
                    maxCharacterLabel(hide: true)
                    return true
                } else {
                    maxCharacterLabel(hide: false)
                    return false
                }
            }
        }
        maxCharacterLabel(hide: true)
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = textField.text {
            mainView.addButton.isEnabled = !text.isEmpty
        }
    }
}

extension CreateCategoryVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainView.iconsCollection {
            return createCategoryVM.categoryImages.count
        } else if collectionView == mainView.colorsCollection {
            return createCategoryVM.colors.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainView.iconsCollection {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageViewCell.id, for: indexPath) as? ImageViewCell else {
                return UICollectionViewCell()
            }
            let viewModel = createCategoryVM.categoryImages[indexPath.item]
            cell.setup(with: viewModel)
            return cell
        } else if collectionView == mainView.colorsCollection {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SimpleCircleViewCell.id, for: indexPath) as? SimpleCircleViewCell else {
                return UICollectionViewCell()
            }
            let viewModel = createCategoryVM.colors[indexPath.item]
            cell.setup(with: viewModel)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mainView.iconsCollection {
            createCategoryVM.selectImage(at: indexPath.item)
        } else if collectionView == mainView.colorsCollection {
            createCategoryVM.selectColor(at: indexPath.item)
        }
    }
    
    
}

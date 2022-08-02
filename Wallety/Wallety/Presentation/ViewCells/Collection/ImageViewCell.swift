import UIKit

final class ImageViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let id = "ImageViewCell"
    
    // MARK: - Views
    
    lazy var image: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        manageView()
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    func setup(with viewModel: CategoryImageViewModel) {
        image.image = viewModel.image
    }
    
    // MARK: - Manage views
    
    private func manageView() {
        backgroundColor = .clear
    }
    
    private func addSubviews() {
        addSubview(image)
    }
    
    private func setConstraints() {
        image.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(self)
        }
    }
}

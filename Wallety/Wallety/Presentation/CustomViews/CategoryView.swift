import UIKit

final class CategoryView: UIView {
    
    // MARK: - Views

    lazy var categoryImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
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
    
    func update(color: UIColor) {
        backgroundColor = color
    }
    
    func update(image: UIImage) {
        categoryImage.image = image
    }
    
    // MARK: - Manage views
    
    private func manageView() {
        backgroundColor = .clear
    }
    
    private func addSubviews() {
        addSubview(categoryImage)
    }
    
    private func setConstraints() {
        categoryImage.snp.makeConstraints { make in
            make.centerY.centerX.equalTo(self)
            make.height.width.equalTo(30)
        }
    }
    
}

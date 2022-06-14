import UIKit

final class TitleViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let id = "CategoryViewCell"
    
    // MARK: - Views
    
    lazy var nameLabel: UILabel = {
        let view = UILabel(text: "Ho-",
                           font: CustomFonts.light(10).roboto,
                           textColor: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Manage views
    
    func manageView(backgroundColor: UIColor? = .clear, cornerRadius: CGFloat = 8) {
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
    }
    
    private func addSubviews() {
        self.addSubview(nameLabel)
    }
    
    // MARK: - Constraints
    
    private func addConstraints() {
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(3)
            make.bottom.equalTo(self).offset(-3)
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).offset(-20)
        }
        
    }
    
}

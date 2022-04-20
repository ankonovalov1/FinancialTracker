import UIKit

final class CategoryViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let id = "CategoryViewCell"
    
    // MARK: - Views
    
    lazy var nameLabel: UILabel = {
        let view = UILabel(text: "",
                           font: UIFont(name: "KohinoorGujarati-Regular", size: 10)!,
                           textColor: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Manage views
    
    private func manageView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = R.color.secondaryBackground()
        self.layer.cornerRadius = 8
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

import UIKit

final class SimpleCircleViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let id = "SimpleCircleViewCell"
    
    // MARK: - View
    
    lazy var circleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 13
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .clear
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Internal
    
    func setup(with viewModel: ColorViewModel) {
        circleView.backgroundColor = viewModel.color
    }
    
    // MARK: - Manage view
    
    private func addSubviews() {
        addSubview(circleView)
    }
    
    private func setConstraints() {
        circleView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(self)
        }
    }
    
}

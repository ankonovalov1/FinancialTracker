import UIKit

final class PrivacyPoliceView: UIView {
    
    // MARK: - Views
    
    lazy var policyTextField: UITextView = {
        let view = UITextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        view.textColor = .white
        view.font = UIFont(name: "KohinoorGujarati-Regular", size: 12)!
        view.isEditable = false
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        manageView()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Manage views
    
    private func manageView() {
        self.backgroundColor = R.color.primaryBackground()
    }
    
    private func addSubviews() {
        
        [
            policyTextField
        ].forEach {
            self.addSubview($0)
        }
        
    }
    
    // MARK: - Constraints
    
    private func addConstraints() {
        
        policyTextField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(30)
            make.bottom.equalTo(self)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
        }
        
    }
    
}

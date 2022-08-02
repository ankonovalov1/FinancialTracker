import UIKit

final class BalanceInfoView: UIView {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        let font = CustomFonts.regular(10).roboto
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = font
        label.textColor = .white
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        let font = CustomFonts.medium(18).roboto
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = font
        label.textColor = .white
        return label
    }()
    
    init(title: String, value: String, backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.layer.cornerRadius = 12
        self.backgroundColor = backgroundColor
        titleLabel.text = title
        valueLabel.text = value
        manageView()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func manageView() {
        layer.defaultShadow()
    }
    
    private func addSubviews() {
        [
            titleLabel,
            valueLabel
        ].forEach {
            self.addSubview($0)
        }
    }
    
    private func addConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(6)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        valueLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY).offset(7)
        }
        
    }
    
}
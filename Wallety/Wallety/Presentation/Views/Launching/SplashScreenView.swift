import UIKit
import SnapKit

final class SplashScreenView: UIView {

    // MARK: - Views
    
    lazy var logoImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = R.image.moneyCircle()
        return view
    }()
    
    lazy var headerLabel: UILabel = {
        let view = UILabel()
        view.text  = R.string.localizable.hello()
        view.textColor = .white
        let font = CustomFonts.bold(34).roboto
        view.font = font
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.text  = R.string.localizable.controlIncomeAndSpendings()
        view.textColor = .white
        let font = CustomFonts.light(18).roboto
        view.numberOfLines = 2
        view.lineBreakMode = .byWordWrapping
        view.font = font
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = R.color.primaryBackground()
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Manage subviews
    
    private func addSubviews() {
        [
            logoImage,
            headerLabel,
            descriptionLabel]
            .forEach {
                self.addSubview($0)
        }
    }
    
    // MARK: - Constraints
    
    private func setConstraints() {
        
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(self).offset(184)
            make.centerX.equalTo(self)
            make.width.height.equalTo(180)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(40)
            make.centerX.equalTo(self)
            make.width.equalTo(self)
            make.height.equalTo(41)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(16)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(60)
        }
        
    }
    
}

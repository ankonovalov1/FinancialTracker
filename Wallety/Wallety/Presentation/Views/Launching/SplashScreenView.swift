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
        view.text  = "Привет!"
        view.textColor = .white
        let font = UIFont(name: "KohinoorGujarati-Bold", size: 34)!
        view.font = font
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.text  = "Контроллируй свои доходы и расходы в несколько кликов"
        view.textColor = .white
        let font = UIFont(name: "KohinoorGujarati-Regular", size: 18)!
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
            make.width.equalTo(self)
            make.height.equalTo(60)
        }
        
    }
    
}

import UIKit

final class AboutScreenView: UIView {
    
    // MARK: - Views

    lazy var appImage: UIImageView = {
        let image = UIImage(resource: R.image.moneyCircle)
        let view = UIImageView(image: image)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var appNameLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        let font = UIFont(name: "KohinoorGujarati-Regular", size: 18)!
        view.textColor = .white
        view.text = "WALLETY"
        return view
    }()
    
    lazy var appVersionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        let font = UIFont(name: "KohinoorGujarati-Regular", size: 18)!
        view.textColor = .white
        view.text = "Version: 1.0.0"
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        let font = UIFont(name: "KohinoorGujarati-Regular", size: 16)!
        view.textColor = .white
        view.text = "Удобное приложение для учета ваших финансов"
        view.numberOfLines = 2
        view.textAlignment = .center
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
            appImage,
            appNameLabel,
            appVersionLabel,
            descriptionLabel
        ].forEach {
            self.addSubview($0)
        }
        
    }
    
    // MARK: - Constraints
    
    private func addConstraints() {
        
        appImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(93)
            make.centerX.equalTo(self)
            make.height.width.equalTo(150)
        }
        
        appNameLabel.snp.makeConstraints { make in
            make.top.equalTo(appImage.snp.bottom).offset(46)
            make.centerX.equalTo(self)
        }
        
        appVersionLabel.snp.makeConstraints { make in
            make.top.equalTo(appNameLabel.snp.bottom).offset(15)
            make.centerX.equalTo(self)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(-150)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
        }
        
    }
    
}

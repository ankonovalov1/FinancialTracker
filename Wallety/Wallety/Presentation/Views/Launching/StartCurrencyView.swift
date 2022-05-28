import UIKit

final class StartCurrencyView: UIView {
    
    // MARK: - Properties
    
    let currencies = [
        R.string.localizable.dollar(),
        R.string.localizable.ruble(),
        R.string.localizable.euro()
    ]

    // MARK: - Views
    
    lazy var walletImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = R.image.moneyCircle()
        return view
    }()
    
    lazy var mainLabel: UILabel = {
        let view = UILabel()
        view.text  = R.string.localizable.chooseCurrencyFor()
        view.textColor = .white
        let font = UIFont(name: "KohinoorGujarati-Regular", size: 24)!
        view.numberOfLines = 2
        view.font = font
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var currencySegment: UISegmentedControl = {
        let view = UISegmentedControl(items: currencies)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = R.color.primaryBackground()
        view.selectedSegmentTintColor = R.color.baseElementsBlue()
        view.selectedSegmentIndex = 1
        view.setTitleTextAttributes(   [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "KohinoorGujarati-Regular", size: 12)!
        ], for: .normal)
        
        return view
    }()
    
    lazy var setButton: WButton = {
        let view = WButton(type: .system)
        view.backgroundColor = R.color.baseElementsBlue()
        let title = NSAttributedString(
            string: R.string.localizable.setButton(),
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: UIFont(name: "KohinoorGujarati-Regular", size: 14)!
            ]
        )
        view.setAttributedTitle(title, for: .normal)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.text  = R.string.localizable.changeCurrencyInfo()
        view.textColor = .white.withAlphaComponent(0.5)
        let font = UIFont(name: "KohinoorGujarati-Regular", size: 14)!
        view.numberOfLines = 2
        view.font = font
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var frameLayer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = R.color.secondaryBackground()?.cgColor
        let bounds = UIScreen.main.bounds
        let height = (bounds.height / 2) + (30 * 2)
        let yOffset = (bounds.height/2) - 30
        layer.frame = CGRect(x: 0, y: yOffset, width: bounds.width, height: height)
        layer.cornerRadius = 30
        return layer
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
        
        self.layer.addSublayer(frameLayer)
        
        [
            walletImage,
            mainLabel,
            currencySegment,
            setButton,
            descriptionLabel
        ].forEach {
            self.addSubview($0)
        }
    }
    
    // MARK: - Constraints
    
    private func setConstraints() {
        
        walletImage.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.centerX.equalTo(self)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(80)
            make.centerX.equalTo(self)
            make.top.equalTo(self.snp.centerY)
        }
        
        currencySegment.snp.makeConstraints { make in
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(32)
            make.centerX.equalTo(self)
            make.top.equalTo(mainLabel.snp.bottom).offset(41)
        }
        
        setButton.snp.makeConstraints { make in
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(50)
            make.centerX.equalTo(self)
            make.top.equalTo(currencySegment.snp.bottom).offset(41)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.centerX.equalTo(self)
            make.bottom.equalTo(self).offset(-32)
        }
        
    }
    
}

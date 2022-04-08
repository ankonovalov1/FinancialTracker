import UIKit
import SnapKit

final class AfterLaunchView: UIView {
    
    // MARK: Views
    
    lazy var walletImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = R.image.moneyCircle()
        return view
    }()
    
    lazy var mainLabel: UILabel = {
        let view = UILabel()
        view.text  = "Установите свой текущий баланс"
        view.textColor = .white
        let font = UIFont(name: "KohinoorGujarati-Regular", size: 24)!
        view.numberOfLines = 2
        view.font = font
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var balanceTextField: WTextField = {
        let view = WTextField()
        view.attributedPlaceholder = NSAttributedString(
            string: "Баланс",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor(white: 1, alpha: 0.5),
                NSAttributedString.Key.font: UIFont(name: "KohinoorGujarati-Regular", size: 14)!
            ]
        )
        view.textColor = .white
        view.keyboardType = .decimalPad
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        view.layer.borderColor = R.color.baseElementsBlue()?.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var setButton: WButton = {
        let view = WButton(type: .system)
        view.backgroundColor = R.color.baseElementsBlue()
        let title = NSAttributedString(
            string: "Установить",
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
    
    lazy var skipButton: UIButton = {
        let view = UIButton(type: .system)
        let title = NSAttributedString(
            string: "Пропустить",
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor(white: 1, alpha: 0.5),
                NSAttributedString.Key.font: UIFont(name: "KohinoorGujarati-Regular", size: 14)!
            ]
        )
        view.setAttributedTitle(title, for: .normal)
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
    
    // MARK: Constructors
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = R.color.primaryBackground()
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Manage subviews
    
    private func addSubviews() {
        
        self.layer.addSublayer(frameLayer)
        
        [
            walletImage,
            mainLabel,
            balanceTextField,
            setButton,
            skipButton
        ].forEach {
            self.addSubview($0)
        }
    }
    
    // MARK: Constraints
    
    private func setConstraints() {
        
        walletImage.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.centerX.equalTo(self)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
        }
        
        mainLabel.snp.makeConstraints { make in
            make.left.equalTo(self).offset(30)
            make.right.equalTo(self).offset(-30)
            make.height.equalTo(80)
            make.centerX.equalTo(self)
            make.top.equalTo(self.snp.centerY)
        }
        
        balanceTextField.snp.makeConstraints { make in
            make.left.equalTo(self).offset(30)
            make.right.equalTo(self).offset(-30)
            make.height.equalTo(49)
            make.centerX.equalTo(self)
            make.top.equalTo(mainLabel.snp.bottom).offset(48)
        }
        
        setButton.snp.makeConstraints { make in
            make.left.equalTo(self).offset(30)
            make.right.equalTo(self).offset(-30)
            make.height.equalTo(49)
            make.centerX.equalTo(self)
            make.top.equalTo(balanceTextField.snp.bottom).offset(19)
        }
        
        skipButton.snp.makeConstraints { make in
            make.left.equalTo(self).offset(30)
            make.right.equalTo(self).offset(-30)
            make.height.equalTo(20)
            make.centerX.equalTo(self)
            make.top.equalTo(setButton.snp.bottom).offset(19)
        }
        
    }
    
}

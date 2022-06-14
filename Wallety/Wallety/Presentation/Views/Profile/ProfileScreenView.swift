import UIKit

final class ProfileScreenView: UIView {
    
    // MARK: - Views

    lazy var profileLogo: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(resource: R.image.profileLogo)
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 132 / 2
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var nicknameTextField: UITextField = {
        let view = UITextField()
        let font = CustomFonts.light(18).roboto
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "@user"
        view.font = font
        view.textColor = .white
        view.textAlignment = .center
        view.isEnabled = false
        return view
    }()
    
    lazy var stackForInputs: UIStackView = {
        let view = UIStackView(arrangedSubviews: [stackForEmails, stackForBalances, stackForDuty, stackForInvestments])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 0
        return view
    }()
    
    lazy var stackForEmails: UIStackView = {
        let view = UIStackView(arrangedSubviews: [emailLabel, emailTextField])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 0
        return view
    }()
    
    lazy var emailLabel: UILabel = {
        let view = UILabel()
        let font = CustomFonts.light(14).roboto
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = R.string.localizable.email()
        view.font = font
        view.textColor = .white
        return view
    }()
    
    lazy var emailTextField: UITextField = {
        let view = UITextField()
        let font = CustomFonts.light(14).roboto
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = R.string.localizable.email()
        view.font = font
        view.textColor = .white
        view.keyboardType = .emailAddress
        view.textAlignment = .right
        view.isEnabled = false
        return view
    }()
    
    lazy var stackForBalances: UIStackView = {
        let view = UIStackView(arrangedSubviews: [balanceLabel, balanceValueLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 0
        return view
    }()
    
    lazy var balanceLabel: UILabel = {
        let view = UILabel()
        let font = CustomFonts.light(14).roboto
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = R.string.localizable.balance()
        view.font = font
        view.textColor = .white
        return view
    }()
    
    lazy var balanceValueLabel: UILabel = {
        let view = UILabel()
        let font = CustomFonts.light(14).roboto
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = R.string.localizable.balance()
        view.font = font
        view.textColor = R.color.baseElementsGreen()
        view.textAlignment = .right
        return view
    }()
    
    lazy var stackForDuty: UIStackView = {
        let view = UIStackView(arrangedSubviews: [dutyLabel, dutyValueLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 0
        return view
    }()
    
    lazy var dutyLabel: UILabel = {
        let view = UILabel()
        let font = CustomFonts.light(14).roboto
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = R.string.localizable.debts()
        view.font = font
        view.textColor = .white
        return view
    }()
    
    lazy var dutyValueLabel: UILabel = {
        let view = UILabel()
        let font = CustomFonts.light(14).roboto
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = R.string.localizable.debts()
        view.font = font
        view.textColor = R.color.baseElementsRed()
        view.textAlignment = .right
        return view
    }()
    
    lazy var stackForInvestments: UIStackView = {
        let view = UIStackView(arrangedSubviews: [investmentLabel, investmentValueLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 0
        return view
    }()
    
    lazy var investmentLabel: UILabel = {
        let view = UILabel()
        let font = CustomFonts.light(14).roboto
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = R.string.localizable.investments()
        view.font = font
        view.textColor = .white
        return view
    }()
    
    lazy var investmentValueLabel: UILabel = {
        let view = UILabel()
        let font = CustomFonts.light(14).roboto
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = R.string.localizable.investments()
        view.font = font
        view.textColor = R.color.baseElementsBlue()
        view.textAlignment = .right
        view.isEnabled = false
        return view
    }()
    
    lazy var changeButton: WButton = {
        let view = WButton(type: .system)
        view.backgroundColor = R.color.baseElementsBlue()
        let title = NSAttributedString(
            string:  R.string.localizable.buttonChange(),
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: CustomFonts.light(14).roboto
            ]
        )
        view.setAttributedTitle(title, for: .normal)
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
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
    
    // MARK: - Internal

    func enableEditing(_ enable: Bool) {
        
        nicknameTextField.isEnabled = enable
        emailTextField.isEnabled = enable
        
        var title: NSAttributedString
        if enable {
            title = NSAttributedString(
                string: R.string.localizable.save(),
                attributes: [
                    NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.font: CustomFonts.light(14).roboto
                ]
            )
        }
        else {
            title = NSAttributedString(
                string:  R.string.localizable.buttonChange(),
                attributes: [
                    NSAttributedString.Key.foregroundColor: UIColor.white,
                    NSAttributedString.Key.font: CustomFonts.light(14).roboto
                ]
            )
        }
        changeButton.setAttributedTitle(title, for: .normal)
    }
    
    // MARK: - Private
    
    private func manageView() {
        self.backgroundColor = R.color.primaryBackground()
    }
    
    private func addSubviews() {
        
        [
            profileLogo,
            nicknameTextField,
            stackForInputs,
            changeButton
        ].forEach {
            self.addSubview($0)
        }
        
    }
    
    private func addConstraints() {
        profileLogo.snp.makeConstraints { make in
            make.top.equalTo(self).offset(100)
            make.centerX.equalTo(self)
            make.width.equalTo(132)
            make.height.equalTo(132)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(profileLogo.snp.bottom).offset(26)
            make.centerX.equalTo(self)
            make.width.equalTo(self)
            make.height.equalTo(16)
        }
        
        stackForInputs.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(44)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(121)
        }
        
        changeButton.snp.makeConstraints { make in
            make.top.equalTo(stackForInputs.snp.bottom).offset(26)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(49)
        }
        
    }
    
}

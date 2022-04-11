import UIKit

final class ProfileScreenView: UIView {

    lazy var profileLogo: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(resource: R.image.profileLogo)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var nicknameTextField: UITextField = {
        let view = UITextField()
        let font = UIFont(name: "KohinoorGujarati-Regular", size: 14)!
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "@user"
        view.font = font
        view.textColor = .white
        view.textAlignment = .center
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
        let font = UIFont(name: "KohinoorGujarati-Regular", size: 14)!
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Email"
        view.font = font
        view.textColor = .white
        return view
    }()
    
    lazy var emailTextField: UITextField = {
        let view = UITextField()
        let font = UIFont(name: "KohinoorGujarati-Regular", size: 14)!
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Email"
        view.font = font
        view.textColor = .white
        view.keyboardType = .emailAddress
        view.textAlignment = .right
        return view
    }()
    
    lazy var stackForBalances: UIStackView = {
        let view = UIStackView(arrangedSubviews: [balanceLabel, balanceTextField])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 0
        return view
    }()
    
    lazy var balanceLabel: UILabel = {
        let view = UILabel()
        let font = UIFont(name: "KohinoorGujarati-Regular", size: 14)!
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Баланс"
        view.font = font
        view.textColor = .white
        return view
    }()
    
    lazy var balanceTextField: UITextField = {
        let view = UITextField()
        let font = UIFont(name: "KohinoorGujarati-Regular", size: 14)!
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Баланс"
        view.font = font
        view.textColor = R.color.baseElementsGreen()
        view.keyboardType = .numberPad
        view.textAlignment = .right
        return view
    }()
    
    lazy var stackForDuty: UIStackView = {
        let view = UIStackView(arrangedSubviews: [dutyLabel, dutyTextField])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 0
        return view
    }()
    
    lazy var dutyLabel: UILabel = {
        let view = UILabel()
        let font = UIFont(name: "KohinoorGujarati-Regular", size: 14)!
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Долги"
        view.font = font
        view.textColor = .white
        return view
    }()
    
    lazy var dutyTextField: UITextField = {
        let view = UITextField()
        let font = UIFont(name: "KohinoorGujarati-Regular", size: 14)!
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Долги"
        view.font = font
        view.textColor = R.color.baseElementsRed()
        view.keyboardType = .numberPad
        view.textAlignment = .right
        return view
    }()
    
    lazy var stackForInvestments: UIStackView = {
        let view = UIStackView(arrangedSubviews: [investmentLabel, investmentTextField])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 0
        return view
    }()
    
    lazy var investmentLabel: UILabel = {
        let view = UILabel()
        let font = UIFont(name: "KohinoorGujarati-Regular", size: 14)!
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Инвестиции"
        view.font = font
        view.textColor = .white
        return view
    }()
    
    lazy var investmentTextField: UITextField = {
        let view = UITextField()
        let font = UIFont(name: "KohinoorGujarati-Regular", size: 14)!
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Инвестиции"
        view.font = font
        view.textColor = R.color.baseElementsBlue()
        view.keyboardType = .numberPad
        view.textAlignment = .right
        view.isEnabled = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        manageView()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func manageView() {
        self.backgroundColor = R.color.primaryBackground()
    }
    
    private func addSubviews() {
        
        [
            profileLogo,
            nicknameTextField,
            stackForInputs
        ].forEach {
            self.addSubview($0)
        }
        
    }
    
    private func addConstraints() {
        
        profileLogo.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(100)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(132)
            make.height.equalTo(132)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(profileLogo.snp.bottom).offset(26)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(16)
        }
        
        stackForInputs.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(44)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(305)
            make.height.equalTo(121)
        }
        
    }
    
}

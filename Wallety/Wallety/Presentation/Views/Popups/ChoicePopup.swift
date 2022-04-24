import UIKit

final class ChoicePopup: UIView {
    
    // MARK: - Views
    
    lazy var titleImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = R.image.moneyCircle()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var mainTitleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        let font = UIFont(name: "KohinoorGujarati-Regular", size: 12)!
        view.text = "Выберите тему:"
        view.textColor = .white
        view.font = font
        return view
    }()
    
    lazy var variantTableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = R.color.primaryBackground()
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    lazy var stackForButtons: UIStackView = {
        let view = UIStackView(arrangedSubviews: [okButton, cancelButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 10
        return view
    }()
    
    lazy var okButton: UIButton = {
        let view = UIButton(type: .system)
        let title = NSAttributedString(string: "Выбрать", attributes: [
            NSAttributedString.Key.font : UIFont(name: "KohinoorGujarati-Regular", size: 10)!
        ])
        view.setAttributedTitle(title, for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        view.backgroundColor = R.color.baseElementsBlue()
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var cancelButton: UIButton = {
        let view = UIButton(type: .system)
        let title = NSAttributedString(string: "Отменить", attributes: [
            NSAttributedString.Key.font : UIFont(name: "KohinoorGujarati-Regular", size: 10)!
        ])
        view.setAttributedTitle(title, for: .normal)
        view.setTitleColor(UIColor.white, for: .normal)
        view.backgroundColor = R.color.baseElementsBlue()
        view.layer.cornerRadius = 8
        return view
    }()
    
    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        manageView()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func  manageView() {
        self.backgroundColor = R.color.secondaryBackground()
        self.layer.cornerRadius = 12
    }
    
    private func  addSubviews() {
        [
            titleImage,
            mainTitleLabel,
            variantTableView,
            stackForButtons
        ].forEach {
            self.addSubview($0)
        }
    }
    
    private func  addConstraints() {
        
        titleImage.snp.makeConstraints { make in
            make.top.equalTo(self).offset(15)
            make.centerX.equalTo(self)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        mainTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleImage.snp.bottom).offset(12)
            make.centerX.equalTo(self)
        }
        
        variantTableView.snp.makeConstraints { make in
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(12)
            make.centerX.equalTo(self)
            make.width.equalTo(160)
            make.bottom.equalTo(stackForButtons.snp.top).offset(-12)
        }
        
        stackForButtons.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(-15)
            make.centerX.equalTo(self)
            make.width.equalTo(160)
            make.height.equalTo(27)
        }
        
    }
    
}

extension UIButton {
//    open override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
//        super.point(inside: point, with: event)
//        let t = 1
//        return true
//    }
}

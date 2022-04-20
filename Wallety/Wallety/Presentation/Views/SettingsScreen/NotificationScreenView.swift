import UIKit

final class NotificationScreenView: UIView {
    
    // MARK: - Views

    lazy var stackForLabelSwitcher: UIStackView = {
        let view = UIStackView(arrangedSubviews: [onOffLabel, notificationSwitcher])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fill
        return view
    }()
    
    lazy var onOffLabel: UILabel = {
        let view = UILabel(text: "Получать нотификации",
                           font: UIFont(name: "KohinoorGujarati-Regular", size: 16)!,
                           textColor: .white)
        view.textAlignment = .left
        return view
    }()
    
    lazy var notificationSwitcher: UISwitch = {
        let view = UISwitch()
        view.onTintColor = R.color.baseElementsBlue()
        view.tintColor = R.color.secondaryBackground()
        view.layer.cornerRadius = view.frame.height / 2
        view.backgroundColor = R.color.secondaryBackground()
        return view
    }()
    
    lazy var allNotificationLabel: UILabel = {
        let view = UILabel(text: "Все нотификации",
                           font: UIFont(name: "KohinoorGujarati-Regular", size: 16)!,
                           textColor: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        return view
    }()
    
    lazy var emptyStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [noNotificationLabel, tooltipLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fill
        view.isHidden = true
        return view
    }()
    
    lazy var noNotificationLabel: UILabel = {
        let view = UILabel(text: "Нет нотификаций",
                           font: UIFont(name: "KohinoorGujarati-Regular", size: 26)!,
                           textColor: .white)
        view.textAlignment = .center
        return view
    }()
    
    lazy var tooltipLabel: UILabel = {
        let view = UILabel(text: "убедитесь, что они включены",
                           font: UIFont(name: "KohinoorGujarati-Regular", size: 14)!,
                           textColor: .white.withAlphaComponent(0.5))
        view.textAlignment = .center
        return view
    }()
    
    lazy var notificationTableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = R.color.primaryBackground()
        view.showsVerticalScrollIndicator = false
        view.separatorStyle = .none
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
    
    func change(state: ViewState) {
        
        switch state {
        case .hasData:
            notificationTableView.isHidden = false
            emptyStack.isHidden = true
        case .loading:
            notificationTableView.isHidden = true
            emptyStack.isHidden = true
        case .empty:
            notificationTableView.isHidden = true
            emptyStack.isHidden = false
        }
        
    }
    
    // MARK: - Manage views
    
    private func manageView() {
        self.backgroundColor = R.color.primaryBackground()
    }
    
    private func addSubviews() {
        [
            stackForLabelSwitcher,
            allNotificationLabel,
            emptyStack,
            notificationTableView
        ].forEach {
            self.addSubview($0)
        }
    }
    
    // MARK: - Constraints
    
    private func addConstraints() {
        
        stackForLabelSwitcher.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(70)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
        }
        
        allNotificationLabel.snp.makeConstraints { make in
            make.top.equalTo(stackForLabelSwitcher.snp.bottom).offset(44)
            make.left.equalTo(self).offset(35)
        }
        
        emptyStack.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
        
        notificationTableView.snp.makeConstraints { make in
            make.top.equalTo(allNotificationLabel.snp.bottom).offset(30)
            make.bottom.equalTo(self)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
        }
        
    }
    
}

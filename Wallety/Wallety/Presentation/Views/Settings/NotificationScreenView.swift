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
        let view = UILabel(text: R.string.localizable.recieveNotifications(),
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
        let view = UILabel(text: R.string.localizable.allNotifications(),
                           font: UIFont(name: "KohinoorGujarati-Regular", size: 16)!,
                           textColor: .white)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
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
    
    lazy var emptyView: NoDataEmptyView = {
        let view = NoDataEmptyView(title: R.string.localizable.noNotifications(),
                                   description: R.string.localizable.checkIfEnabled())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
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
            emptyView.isHidden = true
        case .loading:
            notificationTableView.isHidden = true
            emptyView.isHidden = true
        case .empty:
            notificationTableView.isHidden = true
            emptyView.isHidden = false
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
            emptyView,
            notificationTableView
        ].forEach {
            self.addSubview($0)
        }
    }
    
    // MARK: - Constraints
    
    private func addConstraints() {
        
        stackForLabelSwitcher.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(50)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
        }
        
        allNotificationLabel.snp.makeConstraints { make in
            make.top.equalTo(stackForLabelSwitcher.snp.bottom).offset(44)
            make.left.equalTo(self).offset(35)
        }
        
        emptyView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self)
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

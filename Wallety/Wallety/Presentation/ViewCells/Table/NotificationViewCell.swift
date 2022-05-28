import UIKit

final class NotificationViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let id = "NotificationViewCell"
    
    // MARK: - Views
    
    lazy var stackForViews: UIStackView = {
        let view = UIStackView(arrangedSubviews: [themeLabel, dateLabel])
        view.axis = .horizontal
        view.distribution = .fill
        return view
    }()
    
    lazy var themeLabel: UILabel = {
        let view = UILabel(text: R.string.localizable.theme(),
                           font: UIFont(name: "KohinoorGujarati-Bold", size: 10)!,
                           textColor: .white)
        view.textAlignment = .left
        return view
    }()
    
    lazy var dateLabel: UILabel = {
        let view = UILabel(text: "12/12/2022",
                           font: UIFont(name: "KohinoorGujarati-Regular", size: 10)!,
                           textColor: .white)
        view.textAlignment = .right
        return view
    }()
    
    lazy var notificationTextView: UITextView = {
        let view = UITextView()
        view.text = R.string.localizable.notificationExample()
        view.font = UIFont(name: "KohinoorGujarati-Regular", size: 10)!
        view.textAlignment = .left
        view.isEditable = false
        view.backgroundColor = .clear
        view.textColor = .white
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        manageView()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override functions
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            UIView.animate(withDuration: 0.3) {
                self.backgroundColor = R.color.baseElementsBlue()
            } completion: { _ in
                self.backgroundColor = R.color.secondaryBackground()
            }
        }
    }
    
    // MARK: - Internal
    
    func setup(theme: String, date: String, text: String) {
        themeLabel.text = theme
        dateLabel.text = date
        notificationTextView.text = text
    }
    
    // MARK: - Manage views
    
    private func manageView() {
        self.backgroundColor = R.color.secondaryBackground()
        self.layer.cornerRadius = 12
        self.selectionStyle = .none
    }
    
    private func addSubviews() {
        [
            stackForViews,
            notificationTextView,
        ].forEach {
            self.addSubview($0)
        }
    }
    
    // MARK: - Constraints
    
    private func addConstraints() {
        
        stackForViews.snp.makeConstraints { make in
            make.top.equalTo(self).offset(10)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(12)
            make.right.equalTo(self).offset(-12)
        }
        
        notificationTextView.snp.makeConstraints { make in
            make.top.equalTo(stackForViews.snp.bottom).offset(6)
            make.bottom.equalTo(self).offset(-10)
            make.left.equalTo(self).offset(12)
            make.right.equalTo(self).offset(-12)
        }
        
    }

}

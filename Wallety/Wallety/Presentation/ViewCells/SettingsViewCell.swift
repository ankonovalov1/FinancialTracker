import UIKit

final class SettingsViewCell: UITableViewCell {
    
    static let id = "SettingsViewCell"
    
    lazy var stackForViews: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleLabel])
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.backgroundColor = R.color.secondaryBackground()
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Тема"
        view.textColor = .white
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        manageView()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func  manageView() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
    }
    
    private func  addSubviews() {
        self.addSubview(stackForViews)
    }
    
    private func  addConstraints() {
        
        stackForViews.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
        }
        
    }

}

import UIKit

final class SettingsScreenView: UIView {

    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
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
        self.addSubview(tableView)
    }
    
    private func addConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self).offset(62)
            make.left.bottom.right.equalTo(self)
        }
        
    }
    
}

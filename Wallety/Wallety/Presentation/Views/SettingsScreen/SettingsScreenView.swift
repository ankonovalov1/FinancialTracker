import UIKit

final class SettingsScreenView: UIView {
    
    // MARK: - Views

    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
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
    
    // MARK: - Private
    
    private func manageView() {
        self.backgroundColor = R.color.primaryBackground()
    }
    
    private func addSubviews() {
        self.addSubview(tableView)
    }
    
    private func addConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.left.bottom.right.equalTo(self)
        }
        
    }
    
}

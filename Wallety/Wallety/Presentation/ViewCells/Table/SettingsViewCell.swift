import UIKit

final class SettingsViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static let id = "SettingsViewCell"
    private var cellType: SettingCellType = .none
    
    var navigate: ((SettingCellType) -> Void)?
    
    // MARK: - Views
    
    lazy var stackForViews: UIStackView = {
        let view = UIStackView(arrangedSubviews: [ titleImageView, titleLabel ])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.backgroundColor = .clear
        view.spacing = 25
        return view
    }()
    
    lazy var titleImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
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
    
    // MARK: - Override
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            UIView.animate(withDuration: 0.3) {
                self.backgroundColor = R.color.baseElementsBlue()
            } completion: { _ in
                self.backgroundColor = R.color.secondaryBackground()
            }
            navigate?(cellType)
        }
    }
    
    // MARK: - Internal
    
    func setup(model: SettingModel) {
        
        titleImageView.image = model.image
        cellType = model.cellType
        titleLabel.attributedText = NSAttributedString(string: cellType.name, attributes: [
            NSAttributedString.Key.font : UIFont(name: "KohinoorGujarati-Regular", size: 12)!
        ])
        
    }
    
    // MARK: - Private
    
    private func  manageView() {
        self.backgroundColor = R.color.secondaryBackground()
        self.selectionStyle = .none
        self.accessoryView = UIImageView(image: UIImage(resource: R.image.arrowRightWhite))
    }
    
    private func  addSubviews() {
        self.addSubview(stackForViews)
    }
    
    private func  addConstraints() {
        
        stackForViews.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.left.equalTo(self)
            make.right.equalTo(self)
        }
        
        titleImageView.snp.makeConstraints { make in
            make.height.width.equalTo(20)
            make.left.equalTo(stackForViews.snp.left).offset(25)
        }
        
    }

}

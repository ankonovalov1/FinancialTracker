import UIKit

final class NoDataEmptyView: UIView {
    
    // MARK: - Properties
    
    override var isHidden: Bool {
        get {
            return emptyStack.isHidden
        }
        set {
            emptyStack.isHidden = newValue
        }
    }
    
    // MARK: - Views
    
    lazy var emptyStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fill
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel(text: R.string.localizable.noOperations(),
                           font: CustomFonts.light(26).roboto,
                           textColor: .white)
        view.textAlignment = .center
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let view = UILabel(text: R.string.localizable.forThisPeriod(),
                           font: CustomFonts.light(14).roboto,
                           textColor: .white.withAlphaComponent(0.5))
        view.textAlignment = .center
        return view
    }()
    
    // MARK: - Lifecycle
    
    init(title: String, description: String) {
        super.init(frame: .zero)
        manageView(title: title, description: description)
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func manageView(title: String, description: String) {
        self.backgroundColor = R.color.primaryBackground()
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
    private func addSubviews() {
        self.addSubview(emptyStack)
    }
    
    private func addConstraints() {
        emptyStack.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self)
        }
    }
    
}

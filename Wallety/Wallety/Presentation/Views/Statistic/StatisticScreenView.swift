import UIKit

final class StatisticScreenView: UIView {
    
    // MARK: - Views
    
    lazy var dateCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 1
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        view.allowsSelection = true
        return view
    }()
    
    lazy var emptyStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [noNotificationLabel, tooltipLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fill
        view.isHidden = false
        return view
    }()
    
    lazy var noNotificationLabel: UILabel = {
        let view = UILabel(text: "Нет операций",
                           font: UIFont(name: "KohinoorGujarati-Regular", size: 26)!,
                           textColor: .white)
        view.textAlignment = .center
        return view
    }()
    
    lazy var tooltipLabel: UILabel = {
        let view = UILabel(text: "за данный период",
                           font: UIFont(name: "KohinoorGujarati-Regular", size: 14)!,
                           textColor: .white.withAlphaComponent(0.5))
        view.textAlignment = .center
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
    
//    func change(state: ViewState) {
//
//        switch state {
//        case .hasData:
//            infoTableView.isHidden = false
//            emptyStack.isHidden = true
//        case .loading:
//            infoTableView.isHidden = true
//            emptyStack.isHidden = true
//        case .empty:
//            infoTableView.isHidden = true
//            emptyStack.isHidden = false
//        }
//
//    }
    
    // MARK: - Private
    
    private func manageView() {
        self.backgroundColor = R.color.primaryBackground()
    }
    
    private func addSubviews() {
        
        [
            dateCollectionView,
            emptyStack
        ].forEach {
            self.addSubview($0)
        }
        
    }
    
    private func addConstraints() {
        
        dateCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(60)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(50)
        }
        
        emptyStack.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self)
        }
        
    }

}

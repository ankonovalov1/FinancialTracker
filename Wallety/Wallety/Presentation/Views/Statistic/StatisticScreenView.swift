import UIKit
import Charts

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
    
    lazy var switchViewSegment: UISegmentedControl = {
        let view = UISegmentedControl(items: ["График", "Анализ"])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.selectedSegmentIndex = 0
        view.selectedSegmentTintColor = R.color.baseElementsBlue()
        view.backgroundColor = R.color.secondaryBackground()
        view.setTitleTextAttributes(   [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont(name: "KohinoorGujarati-Regular", size: 12)!
        ], for: .normal)
        return view
    }()
    
    lazy var chartView: LineChartView = {
        let chart = LineChartView()
        chart.xAxis.labelPosition = .bottom
        chart.xAxis.labelTextColor = .white
        chart.xAxis.labelFont = UIFont(name: "KohinoorGujarati-Regular", size: 8)!
        chart.rightAxis.enabled = false
        chart.leftAxis.labelTextColor = .white
        chart.leftAxis.labelFont = UIFont(name: "KohinoorGujarati-Regular", size: 8)!
        chart.xAxis.gridColor = R.color.secondaryBackground()!
        chart.xAxis.axisLineColor = R.color.secondaryBackground()!
        chart.leftAxis.gridColor = R.color.secondaryBackground()!
        chart.leftAxis.axisLineColor = R.color.secondaryBackground()!
        chart.legend.enabled = false
        chart.translatesAutoresizingMaskIntoConstraints = false
        chart.backgroundColor = .clear
        return chart
    }()
    
    lazy var stackForInfoViews: UIStackView = {
        let view = UIStackView(arrangedSubviews: [incomeInfoView, spendingInfoView])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 20
        return view
    }()
    
    lazy var incomeInfoView: BalanceInfoView = {
        let view = BalanceInfoView(title: "Доходы", value: "230,4 $", backgroundColor: R.color.baseElementsGreen()!)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var spendingInfoView: BalanceInfoView = {
        let view = BalanceInfoView(title: "Расходы", value: "38,2 $", backgroundColor: R.color.baseElementsRed()!)
        view.translatesAutoresizingMaskIntoConstraints = false
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
    
    func change(state: ViewState) {

        switch state {
        case .hasData:
            emptyStack.isHidden = true
        case .loading:
            emptyStack.isHidden = true
        case .empty:
            emptyStack.isHidden = false
        }

    }
    
    func setChartData(data: LineChartData) {
        chartView.data = data
        chartView.notifyDataSetChanged()
    }
    
    // MARK: - Private
    
    private func manageView() {
        self.backgroundColor = R.color.primaryBackground()
    }
    
    private func addSubviews() {
        
        [
            dateCollectionView,
            switchViewSegment,
            chartView,
            stackForInfoViews,
            emptyStack
        ].forEach {
            self.addSubview($0)
        }
        
    }
    
    private func addConstraints() {
        
        dateCollectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(50)
        }
        
        switchViewSegment.snp.makeConstraints { make in
            make.top.equalTo(dateCollectionView.snp.bottom).offset(20)
            make.centerX.equalTo(self)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(40)
        }
        
        chartView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(230)
        }
        
        stackForInfoViews.snp.makeConstraints { make in
            make.top.equalTo(chartView.snp.bottom).offset(60)
            make.left.equalTo(self).offset(35)
            make.right.equalTo(self).offset(-35)
            make.height.equalTo(55)
        }
        
        emptyStack.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self)
        }
        
    }

}

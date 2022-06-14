import UIKit
import Charts

final class StatisticScreenVC: UIViewController {
    
    // MARK: - Properties
    
    let mainView = StatisticScreenView()
    let array = ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"]
    
    // MARK: - Lifecycle
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupTabBar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        setupCollectionView()
        addTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createChart(color: R.color.baseElementsRed()!)
    }
    
    // MARK: - @objc
    
    @objc private func changeChart() {
        if mainView.switchViewSegment.selectedSegmentIndex == 0 {
            createChart(color: R.color.baseElementsRed()!)
        }
        else {
            createChart(color: R.color.baseElementsGreen()!)
        }
    }
    
    // MARK: - Private
    
    private func setupTabBar() {
        title = R.string.localizable.statistic()
        self.tabBarItem.image = UIImage(resource: R.image.chartTabWhite)
        self.tabBarItem.selectedImage = UIImage(resource: R.image.chartTabBlue)
        self.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: CustomFonts.light(10).roboto, NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        self.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: R.color.baseElementsBlue()!], for: .highlighted)
    }
    
    private func setupCollectionView() {
        mainView.dateCollectionView.delegate = self
        mainView.dateCollectionView.dataSource = self
        mainView.dateCollectionView.register(TitleViewCell.self, forCellWithReuseIdentifier: TitleViewCell.id)
    }
    
    private func addTargets() {
        mainView.switchViewSegment.addTarget(self, action: #selector(changeChart), for: .valueChanged)
    }
    
    private func createChart(color: UIColor) {
        
        let entries = [
            ChartDataEntry(x: 1, y: 100),
            ChartDataEntry(x: 2, y: 140),
            ChartDataEntry(x: 3, y: 80),
            ChartDataEntry(x: 4, y: 10),
            ChartDataEntry(x: 5, y: 230),
            ChartDataEntry(x: 6, y: 140),
            ChartDataEntry(x: 7, y: 150),
            ChartDataEntry(x: 8, y: 160),
            ChartDataEntry(x: 9, y: 170),
            ChartDataEntry(x: 10, y: 180),
            ChartDataEntry(x: 11, y: 95),
            ChartDataEntry(x: 12, y: 350),
            ChartDataEntry(x: 13, y: 300),
            ChartDataEntry(x: 14, y: 320),
            ChartDataEntry(x: 15, y: 400),
            ChartDataEntry(x: 16, y: 340),
            ChartDataEntry(x: 17, y: 100),
            ChartDataEntry(x: 18, y: 140),
            ChartDataEntry(x: 19, y: 80),
            ChartDataEntry(x: 20, y: 10),
            ChartDataEntry(x: 21, y: 230),
            ChartDataEntry(x: 22, y: 140),
            ChartDataEntry(x: 23, y: 150),
            ChartDataEntry(x: 24, y: 160),
            ChartDataEntry(x: 25, y: 170),
            ChartDataEntry(x: 26, y: 180),
            ChartDataEntry(x: 27, y: 95),
            ChartDataEntry(x: 28, y: 350),
            ChartDataEntry(x: 29, y: 300),
            ChartDataEntry(x: 30, y: 320),
        ]
        
        let dataSet = LineChartDataSet(entries: entries)
        dataSet.drawCircleHoleEnabled = false
        dataSet.drawCirclesEnabled = false
        dataSet.lineCapType = .round
        dataSet.mode = .cubicBezier
        dataSet.lineWidth = 2
        let gradient = CGGradient(colorsSpace: nil, colors: [color.cgColor, color.withAlphaComponent(0.1).cgColor] as CFArray, locations: [1, 0])
        dataSet.fill = LinearGradientFill(gradient: gradient!, angle: 90)
        dataSet.drawFilledEnabled = true
        dataSet.colors = [color]
        dataSet.drawValuesEnabled = false
        let data = LineChartData(dataSet: dataSet)
        mainView.setChartData(data: data)
    }
    
}

extension StatisticScreenVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleViewCell.id, for: indexPath) as? TitleViewCell else { return UICollectionViewCell() }
        cell.manageView()
        cell.nameLabel.font = CustomFonts.light(14).roboto
        cell.nameLabel.text = array[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? TitleViewCell else { return }
        cell.nameLabel.textColor = R.color.baseElementsBlue()
    }
    
}

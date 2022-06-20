import UIKit
import Fastis

final class AddTransactionScreenVC: UIViewController {
    
    private let mainView = AddTransactionScreenView()
    private let viewModel: AddTransactionVM
    
    init(viewModel: AddTransactionVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("AddTransactionScreenVC - was disposed")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        setupTargets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setView()
    }
    
    private func setupTargets() {
        mainView.transactionTypeSegment.addTarget(self, action: #selector(transactionTypeChanged), for: .valueChanged)
        
        let dateTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(dateTapped))
        let categoryTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(categoryChooseTapped))
        let descriptionTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(descriptionWriteTapped))
        
        mainView.dateLable.addGestureRecognizer(dateTapRecognizer)
        mainView.descriptionBehindView.addGestureRecognizer(descriptionTapRecognizer)
        mainView.categoryBehindView.addGestureRecognizer(categoryTapRecognizer)
    }
    
    private func setView() {
        switch viewModel.type {
        case .expenses:
            mainView.transactionTypeSegment.selectedSegmentIndex = 1
        case .income:
            mainView.transactionTypeSegment.selectedSegmentIndex = 0
        }
        transactionTypeChanged()
    }
    
    @objc private func transactionTypeChanged() {
        if mainView.transactionTypeSegment.selectedSegmentIndex == 0 {
            mainView.transactionTypeSegment.selectedSegmentTintColor = R.color.baseElementsGreen()
            viewModel.type = .income
        } else {
            mainView.transactionTypeSegment.selectedSegmentTintColor = R.color.baseElementsRed()
            viewModel.type = .expenses
        }
        
    }
    
    @objc private func dateTapped() {
        UIView.animate(withDuration: 0.3, delay: 0) {
            self.mainView.dateLable.layer.opacity = 0.1
        } completion: { _ in
            self.mainView.dateLable.layer.opacity = 1
            self.openCalandar()
        }
    }
    
    @objc private func categoryChooseTapped() {
        self.mainView.categoryViewTapped()
    }
    
    @objc private func descriptionWriteTapped() {
        self.mainView.descriptionViewTapped()
    }
    
    private func openCalandar() {
        let controller = FastisController(mode: .single)
        controller.initialValue = Date()
        controller.doneHandler = { [weak self] date in
            self?.mainView.dateLable.text = String.from(date: date ?? Date(), format: "YYYY, MMM d")
        }
        controller.present(above: self)
    }
    
}

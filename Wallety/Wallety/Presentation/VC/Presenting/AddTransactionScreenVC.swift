import UIKit
import Fastis

final class AddTransactionScreenVC: UIViewController {
    
    // MARK: - Properties
    
    private let mainView = AddTransactionScreenView()
    private let viewModel: AddTransactionVM
    
    // MARK: - Lifecycle
    
    init(viewModel: AddTransactionVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        mainView.categoriesCollectionView.delegate = self
        mainView.categoriesCollectionView.dataSource = self
        mainView.categoriesCollectionView.register(TitleViewCell.self, forCellWithReuseIdentifier: TitleViewCell.id)
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
        setupCallbacks()
        setupDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func setViewModel(params: [String:Any]) {
        guard let transactionType = params[NavigationParams.transactionType] as? TransactionType else {
            return
        }
        viewModel.type = transactionType
    }
    
    // MARK: - Private
    
    private func setupTargets() {
        mainView.transactionTypeSegment.addTarget(self, action: #selector(transactionTypeChanged), for: .valueChanged)
        
        let dateTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(dateTapped))
        let categoryTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(categoryChooseTapped))
        categoryTapRecognizer.cancelsTouchesInView = false
        let descriptionTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(descriptionWriteTapped))
        descriptionTapRecognizer.cancelsTouchesInView = false
        
        mainView.dateLable.addGestureRecognizer(dateTapRecognizer)
        mainView.descriptionBehindView.addGestureRecognizer(descriptionTapRecognizer)
        mainView.categoryBehindView.addGestureRecognizer(categoryTapRecognizer)
    }
    
    private func setupCallbacks() {
        viewModel.balanceChanged = { [weak self] isEmpty in
            self?.mainView.addButton.isEnabled = !isEmpty
        }
    }
    
    private func setupDelegates() {
        mainView.transactionValueTextField.delegate = self
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
            self.openCalendar()
        }
    }
    
    @objc private func categoryChooseTapped() {
        self.mainView.categoryViewTapped()
    }
    
    @objc private func descriptionWriteTapped() {
        self.mainView.descriptionViewTapped()
    }
    
    private func openCalendar() {
        let controller = FastisController(mode: .single)
        controller.initialValue = Date()
        controller.doneHandler = { [weak self] date in
            self?.mainView.dateLable.text = String.from(date: date ?? Date(), format: "YYYY, MMM d")
        }
        controller.present(above: self)
    }
    
}

extension AddTransactionScreenVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleViewCell.id, for: indexPath) as? TitleViewCell
        else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mainView.chooseCategoryValueLabel.text = "123"
    }
    
}

extension AddTransactionScreenVC: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return viewModel.validate(fullValue: textField.text, value: string)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let isEmpty = textField.text?.isEmpty else { return }
        viewModel.isBalanceEmpty = isEmpty
    }
    
}

//
//  HomeViewController.swift
//  viper
//
//  Created by Alejandro Martinez Barragan on 10/02/23.
//

import UIKit

// MARK: - Class
class HomeViewController: UIViewController {
    // MARK: Properties
    var presenter: HomeViewOutputProtocol?
    private struct Consts {
        static let smallSpace: CGFloat = 8
        static let regularSpace: CGFloat = 16
    }
    
    // MARK: Elements
    lazy var barItem: UIBarButtonItem = {
        UIBarButtonItem(barButtonSystemItem: .refresh,
                        target: self,
                        action: #selector(onButtonClicked))
    }()
    
    lazy var lblCardName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "cardName"
        return label
    }()
    
    lazy var lblCardNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "cardNumber"
        return label
    }()
    
    // MARK: Init methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.fetchModel()
        presenter?.toggleFunction()
    }
    
    // MARK: Functions
    private func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = barItem
        view.backgroundColor = .systemGray6
        // Add labels
        addLabels()
    }
    
    private func addLabels() {
        view.addSubview(lblCardName)
        view.addSubview(lblCardNumber)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            lblCardName.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: Consts.regularSpace),
            lblCardName.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: Consts.regularSpace),
            lblCardName.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -Consts.regularSpace),
            
            lblCardNumber.topAnchor.constraint(equalTo: lblCardName.bottomAnchor, constant: Consts.smallSpace),
            lblCardNumber.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: Consts.regularSpace),
            lblCardNumber.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -Consts.regularSpace)
        ])
    }
    
    @objc
    func onButtonClicked() {
        presenter?.toggleFunction()
    }
}

// MARK: - Extensions
extension HomeViewController: HomeViewInputProtocol {
    func loadView(from model: Model) {
        title = model.title
        lblCardName.text = model.card.title
        lblCardNumber.text = model.card.cardNumber
    }

    func setFormatCardNumber(_ cardNumber: String) {
        lblCardNumber.text = cardNumber
    }
    
    func setMaskedCardNumber(_ cardNumber: String) {
        lblCardNumber.text = cardNumber
    }
}

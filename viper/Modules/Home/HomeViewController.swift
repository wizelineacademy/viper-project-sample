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
    
    // MARK: Elements
    lazy var barItem: UIBarButtonItem = {
        UIBarButtonItem(barButtonSystemItem: .add,
                        target: self,
                        action: #selector(onButtonClicked))
    }()
    
    // MARK: Init methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.fetchModel()
    }
    
    // MARK: Functions
    private func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = barItem
        view.backgroundColor = .systemRed
    }
    
    @objc
    func onButtonClicked() {
        presenter?.goToNextViewController()
    }
}

// MARK: - Extensions
extension HomeViewController: HomeViewInputProtocol {
    func loadView(from model: Model) {
        title = model.title
    }
}

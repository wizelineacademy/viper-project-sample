//
//  SearchViewController.swift
//  viper
//
//  Created by Alejandro Martinez Barragan on 16/02/23.
//

import UIKit

// MARK: - Class
class SearchViewController: UIViewController {
    // MARK: Properties
    var presenter: SearchViewOutputProtocol?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.fetchModel()
    }
    
    // MARK: Functions
    private func setupView() {
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemGray6
    }
}

// MARK: - Extensions
extension SearchViewController: SearchViewInputProtocol {
    func loadView(from model: SearchModel) {
        title = model.title
    }
}

//
//  SearchInteractor.swift
//  viper
//
//  Created by Alejandro Martinez Barragan on 16/02/23.
//

import UIKit

// MARK: - Class
class SearchInteractor {
    weak var presenter: SearchInteractorOutputProtocol?
}

// MARK: Extensions
extension SearchInteractor: SearchInteractorInputProtocol {
    func fetchModel() {
        let model = SearchModel(title: "Search")
        presenter?.presentView(model: model)
    }
}

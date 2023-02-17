//
//  SearchPresenter.swift
//  viper
//
//  Created by Alejandro Martinez Barragan on 16/02/23.
//

import UIKit
 
// MARK: - Class
class SearchPresenter {
    // MARK: Properties
    weak var view: SearchViewInputProtocol?
    var interactor: SearchInteractorInputProtocol?
    var router: SearchRouterProtocol?
    
    // MARK: Init methods
    init(view: SearchViewInputProtocol,
         interactor: SearchInteractorInputProtocol,
         router: SearchRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - Extension
extension SearchPresenter: SearchViewOutputProtocol {
    func fetchModel() {
        interactor?.fetchModel()
    }
}

extension SearchPresenter: SearchInteractorOutputProtocol {
    func presentView(model: SearchModel) {
        view?.loadView(from: model)
    }
}

//
//  HomePresenter.swift
//  viper
//
//  Created by Alejandro Martinez Barragan on 10/02/23.
//

import UIKit

// MARK: - Class
class HomePresenter {
    // MARK: Properties
    weak var view: HomeViewInputProtocol?
    var interactor: HomeInteractorInputProtocol?
    var router: HomeRouterProtocol?
    
    // MARK: Init methods
    init(view: HomeViewInputProtocol,
         interactor: HomeInteractorInputProtocol,
         router: HomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - Extensions
extension HomePresenter: HomeViewOutputProtocol {
    func fetchModel() {
        interactor?.fetchModel()
    }
    
    func goToNextViewController() {
        router?.goToNextViewController()
    }
    
    func toggleFunction() {
        interactor?.toggleFunction()
    }
    
    func getFormatCardNumber() {
        interactor?.getFormatCardNumber()
    }
    
    func getMaskedCardNumber() {
        interactor?.getMaskedCardNumber()
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    func presentView(model: Model) {
        view?.loadView(from: model)
    }
    
    func setFormatCardNumber(_ cardNumber: String) {
        view?.setFormatCardNumber(cardNumber)
    }
    
    func setMaskedCardNumber(_ cardNumber: String) {
        view?.setMaskedCardNumber(cardNumber)
    }
}

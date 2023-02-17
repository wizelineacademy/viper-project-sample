//
//  HomeInteractor.swift
//  viper
//
//  Created by Alejandro Martinez Barragan on 10/02/23.
//

import UIKit

// MARK: - Class
class HomeInteractor {
    weak var presenter: HomeInteractorOutputProtocol?
}

// MARK: - Extensions
extension HomeInteractor: HomeInteractorInputProtocol {
    func fetchModel() {
        let model = Model(title: "Home", description: "Home Screen", systemName: "house")
        presenter?.presentView(model: model)
    }
}

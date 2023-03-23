//
//  HomeInteractor.swift
//  viper
//
//  Created by Alejandro Martinez Barragan on 10/02/23.
//

import UIKit

// MARK: - Class
class HomeInteractor {
    // MARK: - Properties
    weak var presenter: HomeInteractorOutputProtocol?
}

// MARK: - Extensions
extension HomeInteractor: HomeInteractorInputProtocol {
    func fetchModel() {
        let card = Card(title: "BBVA Oro",
                        cardNumber: "1234567898765432",
                        expirationDate: "01/28",
                        cvv: "123")
        let model = Model(title: "Home", description: "Home Screen", card: card)
        presenter?.presentView(model: model)
    }
    
    func getFormatCardNumber() {
        presenter?.setFormatCardNumber("1234 5678 9876 5432")
    }
    
    func getMaskedCardNumber() {
        presenter?.setMaskedCardNumber("**** **** **** 5432")
    }
}

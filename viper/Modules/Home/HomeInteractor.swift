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
    private var cardModel: Card?
    var isMaskedCardNumber = false
}

// MARK: - Extensions
extension HomeInteractor: HomeInteractorInputProtocol {
    
    func fetchModel() {
        let card = Card(title: "BBVA Oro",
                        cardNumber: "1234567898765432",
                        expirationDate: "01/28",
                        cvv: "123")
        self.cardModel = card
        let model = Model(title: "Home", description: "Home Screen", card: card)
        presenter?.presentView(model: model)
    }
    
    func toggleFunction() {
        if isMaskedCardNumber {
            getMaskedCardNumber()
        } else {
            getFormatCardNumber()
        }
        isMaskedCardNumber = !isMaskedCardNumber
    }
    
    func getFormatCardNumber() {
        guard let card = cardModel else { return }
        let formatCardNumber = card.cardNumber.enumerated().reduce("") { partialResult, enumerated in
            let spacing = enumerated.offset % 4 == 0 ? " " : ""
            return partialResult + spacing + "\(enumerated.element)"
        }.split(separator: " ").joined(separator: " ")
        presenter?.setFormatCardNumber(formatCardNumber)
    }
    
    func getMaskedCardNumber() {
        guard let card = cardModel else { return }
        let maskedCardNumber = card.cardNumber.enumerated().reduce("") { partialResult, enumerated in
            let spacing = enumerated.offset % 4 == 0 ? " " : ""
            let maskedDigit = enumerated.offset < 12 ? "*" : "\(enumerated.element)"
            return partialResult + spacing + maskedDigit
        }.split(separator: " ").joined(separator: " ")
        presenter?.setMaskedCardNumber(maskedCardNumber)
    }
}

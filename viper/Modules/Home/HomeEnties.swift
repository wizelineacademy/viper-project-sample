//
//  HomeEnties.swift
//  viper
//
//  Created by Alejandro Martinez Barragan on 10/02/23.
//

import UIKit

// MARK: - Entities
struct Model {
    let title: String
    let description: String
    let card: Card
}

struct Card {
    let title: String
    let cardNumber: String
    let expirationDate: String
    let cvv: String
}

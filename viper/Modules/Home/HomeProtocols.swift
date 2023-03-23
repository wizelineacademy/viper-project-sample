//
//  HomeProtocols.swift
//  viper
//
//  Created by Alejandro Martinez Barragan on 10/02/23.
//

import UIKit

// MARK: - View
protocol HomeViewInputProtocol: AnyObject {
    var presenter: HomeViewOutputProtocol? { get }
    // MARK: Functions
    func loadView(from model: Model)
    func setFormatCardNumber(_ cardNumber: String)
    func setMaskedCardNumber(_ cardNumber: String)
}

// MARK: - Interactor
protocol HomeInteractorInputProtocol {
   var presenter: HomeInteractorOutputProtocol? { get }
    // MARK: Functions
    func fetchModel()
    func getFormatCardNumber()
    func getMaskedCardNumber()
}

// MARK: - Presenter
protocol HomeViewOutputProtocol {
    var view: HomeViewInputProtocol? { get }
    var interactor: HomeInteractorInputProtocol? { get }
    var router: HomeRouterProtocol? { get }
    // MARK: Functions
    func fetchModel()
    func goToNextViewController()
    func getFormatCardNumber()
    func getMaskedCardNumber()
}

protocol HomeInteractorOutputProtocol: AnyObject {
    func presentView(model: Model)
    func setFormatCardNumber(_ cardNumber: String)
    func setMaskedCardNumber(_ cardNumber: String)
}

// MARK: - Router
protocol HomeRouterProtocol {
    func goToNextViewController()
}

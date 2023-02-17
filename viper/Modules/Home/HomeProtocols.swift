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
}

// MARK: - Interactor
protocol HomeInteractorInputProtocol {
   var presenter: HomeInteractorOutputProtocol? { get }
    // MARK: Functions
    func fetchModel()
}

// MARK: - Presenter
protocol HomeViewOutputProtocol {
    var view: HomeViewInputProtocol? { get }
    var interactor: HomeInteractorInputProtocol? { get }
    var router: HomeRouterProtocol? { get }
    // MARK: Functions
    func fetchModel()
    func goToNextViewController()
}

protocol HomeInteractorOutputProtocol: AnyObject {
    func presentView(model: Model)
}

// MARK: - Router
protocol HomeRouterProtocol {
    func goToNextViewController()
}

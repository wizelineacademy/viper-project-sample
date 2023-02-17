//
//  SearchProtocols.swift
//  viper
//
//  Created by Alejandro Martinez Barragan on 16/02/23.
//

import UIKit

// MARK: - View
protocol SearchViewInputProtocol: AnyObject {
    var presenter: SearchViewOutputProtocol? { get }
    // MARK: Functions
    func loadView(from model: SearchModel)
}

// MARK: - Interactor
protocol SearchInteractorInputProtocol {
   var presenter: SearchInteractorOutputProtocol? { get }
    // MARK: Functions
    func fetchModel()
}

// MARK: - Presenter
protocol SearchViewOutputProtocol {
    var view: SearchViewInputProtocol? { get }
    var interactor: SearchInteractorInputProtocol? { get }
    var router: SearchRouterProtocol? { get }
    // MARK: Functions
    func fetchModel()
}

protocol SearchInteractorOutputProtocol: AnyObject {
    func presentView(model: SearchModel)
}

// MARK: - Router
protocol SearchRouterProtocol {
    // code
}

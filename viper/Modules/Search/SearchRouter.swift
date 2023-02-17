//
//  SearchRouter.swift
//  viper
//
//  Created by Alejandro Martinez Barragan on 16/02/23.
//

import UIKit

// MARK: - Class
class SearchRouter {
    // MARK: Properties
    weak var viewController: UIViewController?
    private struct Const {
        static let title = "Search"
        static let tabIcon = UIImage(systemName: "magnifyingglass")
    }
    
    // MARK: Functions
    static func createModule() -> UINavigationController {
        let view = SearchViewController()
        let interactor = SearchInteractor()
        let router = SearchRouter()
        let presenter = SearchPresenter(view: view,
                                        interactor: interactor,
                                        router: router)
        view.presenter = presenter
        view.tabBarItem.title = Const.title
        view.tabBarItem.image = Const.tabIcon
        interactor.presenter = presenter
        router.viewController = view
        
        let navController = UINavigationController()
        navController.viewControllers = [view]
        
        return navController
    }
}

// MARK: - Extensions
extension SearchRouter: SearchRouterProtocol {
    // code
}

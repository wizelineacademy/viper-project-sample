//
//  HomeRouter.swift
//  viper
//
//  Created by Alejandro Martinez Barragan on 10/02/23.
//

import UIKit

// MARK: - Class
class HomeRouter {
    // MARK: Properties
    weak var viewController: UIViewController?
    private struct Const {
        static let title = "Home"
        static let tabIcon = UIImage(systemName: "house")
    }
    lazy var nextController: UIViewController = {
        let controller = UIViewController()
        controller.title = "New Module"
        controller.view.backgroundColor = .lightGray
        return controller
    }()
    
    // MARK: Functions
    static func createModule() -> UINavigationController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        let presenter = HomePresenter(view: view,
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
extension HomeRouter: HomeRouterProtocol {
    func goToNextViewController() {
        viewController?.navigationController?.pushViewController(nextController, animated: true)
    }
}

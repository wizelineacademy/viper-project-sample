//
//  AppDelegate.swift
//  viper
//
//  Created by Alejandro Martinez Barragan on 10/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let screen = UIScreen.main.bounds
        window = UIWindow(frame: screen)
        let tabBarViewController = UITabBarController()
        tabBarViewController.viewControllers = [HomeRouter.createModule(), SearchRouter.createModule()]
        tabBarViewController.tabBar.unselectedItemTintColor = .systemBackground
        tabBarViewController.tabBar.tintColor = .systemOrange
        tabBarViewController.tabBar.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.7)
        // add tabBarViewController as rootViewController
        window?.rootViewController = tabBarViewController
        window?.makeKeyAndVisible()
        
        return true
    }
    
}


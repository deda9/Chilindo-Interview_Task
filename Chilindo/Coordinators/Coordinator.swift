//
//  Coordinator.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import UIKit

/**
 *
 * Coordinator has all the oprations to open the view
 */
protocol LoginViewNavigations {
    func openHomeView()
}

class Coordinator {
    weak var window: UIWindow!
    weak var navigationController: UINavigationController!
    
    init(_ window: UIWindow){
        if(UserDefaultsUtils.getUserEmail() != "NONE"){
            let view = HomeViewController(nibName: "HomeView", bundle: nil)
            navigationController = UINavigationController(rootViewController: view)
        }else{
            let loginView = LoginViewController(nibName: "LoginView", bundle: nil)
            loginView.navigationDelegate = self
            navigationController = UINavigationController(rootViewController: loginView)
        }
        
        self.window = window
    }
    
    func start(){
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
}

//
//MARK: Login view navigations
//
extension Coordinator: LoginViewNavigations{
    func openHomeView(){
        let homeView = HomeViewController()
        navigationController.pushViewController(homeView, animated: true)

    }
}

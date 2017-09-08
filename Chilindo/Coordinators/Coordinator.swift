//
//  Coordinator.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import UIKit

protocol LoginViewNavigations {
    func openHomeView()
}
class Coordinator {
    weak var window: UIWindow!
    weak var navigationController: UINavigationController!
    
    init(_ window: UIWindow){
        let loginView = LoginViewController(nibName: "LoginView", bundle: nil)
        loginView.navigationDelegate = self
        navigationController = UINavigationController(rootViewController: loginView)
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

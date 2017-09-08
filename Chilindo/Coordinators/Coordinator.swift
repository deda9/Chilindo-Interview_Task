//
//  Coordinator.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import UIKit

class Coordinator {
    weak var window: UIWindow!
    weak var navigationController: UINavigationController!
    
    init(_ window: UIWindow){
        let loginView = HomeViewController()
        navigationController = UINavigationController(rootViewController: loginView)
        self.window = window
    }
    
    func start(){
        self.window.rootViewController = navigationController
        self.window.makeKeyAndVisible()
    }
}

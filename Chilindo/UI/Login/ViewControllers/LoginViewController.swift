//
//  LoginViewController.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    var navigationDelegate: LoginViewNavigations!
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
    }
    
    //
    //MARK: Actions
    //
    @IBAction func loginWithFacebook(_ sender: Any) {
        _ = FacebookLoginRequest().login(success: {
            
        }) { error in
            
        }
        
    }
    
    @IBAction func skipToHomeView(_ sender: Any) {
        navigationDelegate.openHomeView()
    }
}

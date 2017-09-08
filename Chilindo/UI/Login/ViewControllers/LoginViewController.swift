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
        if let accessToken = FacebookLoginUtls().login() {
            FacebookLoginRequest()
                .login(accessToken: accessToken, onSuccess: { user in
                    UserDefaultsUtils.saveUserName(user.name)
                    UserDefaultsUtils.saveUserEmail(user.email)
                    UserDefaultsUtils.saveUserProfileUrl(self.getUserProfile(user))
                    UserDefaultsUtils.saveUserCoverUrl(user.cover?.source)
                }, onError: { error in
                    
                })
        }
    }
    
    func getUserProfile(_ user: User) -> String? {
        if let id = user.id{
            return "http://graph.facebook.com/" + id + "/picture?type=large"
        }else{
            return user.picture?.data?.url
        }
    }
    
    @IBAction func skipToHomeView(_ sender: Any) {
        navigationDelegate.openHomeView()
    }
}

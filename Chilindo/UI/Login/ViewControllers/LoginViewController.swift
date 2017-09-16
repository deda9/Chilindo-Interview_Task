//
//  LoginViewController.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit
import RxSwift
import Accounts

/**
 *
 * Login view with facebook
 */
class LoginViewController: BaseViewController {
    
    lazy var facebookLoginNetworkRequest = FacebookNetworkLoginRequest()
    var navigationDelegate: LoginViewNavigations!
    lazy var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideNavigationBar()
    }
    
    //
    //MARK: Actions
    //
    @IBAction func loginWithFacebook(_ sender: Any) {
        showProgressDialog()
        
        facebookLoginNetworkRequest.loginUserWithFacebook()
            .subscribe(onNext: { [unowned self] user in
                self.hideProgressDialog()
                UserDefaultsUtils.saveUserName(user.name)
                UserDefaultsUtils.saveUserEmail(user.email)
                UserDefaultsUtils.saveUserProfileUrl(self.getUserProfile(user))
                UserDefaultsUtils.saveUserCoverUrl(user.cover?.source)
                self.navigationDelegate.openHomeView()
                }, onError: { error in
                    
                    self.hideProgressDialog()
                    
                    if  error._code == Int(ACErrorAccountNotFound.rawValue) {
                        AppUtils.showErrorMessage("There is no Facebook accounts configured. you can add or created a Facebook account in your settings.")
                    }else{
                        AppUtils.showErrorMessage("Permission not granted For Your Application")
                    }
                    
            }).addDisposableTo(disposeBag)
    }
    
    func getUserProfile(_ user: User) -> String? {
        if let id = user.id{
            return "http://graph.facebook.com/" + id + "/picture?type=normal"
        }else{
            return user.picture?.data?.url
        }
    }
    
    @IBAction func skipToHomeView(_ sender: Any) {
        navigationDelegate.openHomeView()
    }
}

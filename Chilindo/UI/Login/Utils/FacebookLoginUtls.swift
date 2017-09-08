//
//  FacebookLoginRequest.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import Accounts

protocol FacebookLogin{
    func login() -> String?
}

class FacebookLoginUtls: FacebookLogin{
    
    static var mOauthToken: String?
    
    func login() -> String? {
        let accountStore = ACAccountStore()
        var facebookAccount: ACAccount?
        let options:[String : Any] = [ACFacebookAppIdKey: Constants.FACEBOOK_API_KEY,
                                      ACFacebookPermissionsKey: ["email", "public_profile"]]
        
        let facebookAccountType = accountStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierFacebook)
        accountStore.requestAccessToAccounts(with: facebookAccountType, options: options) { (granted:Bool, error:Error?) in
            if granted {
                let accounts = accountStore.accounts(with: facebookAccountType)
                facebookAccount = accounts?.last as? ACAccount
                
                let credentials = facebookAccount?.credential
                let oauthToken = credentials?.oauthToken
                
                DispatchQueue.main.async {
                    FacebookLoginUtls.mOauthToken = oauthToken
                }
                
            }
            else {
                if let err = error as? NSError, err.code == Int(ACErrorAccountNotFound.rawValue) {
                    AppUtils.showErrorMessage("There is no Facebook accounts configured. you can add or created a Facebook account in your settings.")
                } else {
                    AppUtils.showErrorMessage("Permission not granted For Your Application")
                }
            }
        }
        return FacebookLoginUtls.mOauthToken
    }
}

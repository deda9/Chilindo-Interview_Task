//
//  FacebookLoginRequest.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import Accounts

public protocol FacebookLogin{
    func login(success:()->(), failure: (Error )->())
    func login(accessToke: String, success:()->(), failure: (Error)->())
}

class FacebookLoginRequest{
    
    func login(success: () -> (), failure: (Error) -> ()) {
        let accountStore = ACAccountStore()
        var facebookAccount: ACAccount?
        let options:[String : Any] = [ACFacebookAppIdKey: Constants.FACEBOOK_API_KEY,
                                      ACFacebookPermissionsKey: ["email", "public_profile"]]
        
        let facebookAccountType = accountStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierFacebook)
        accountStore.requestAccessToAccounts(with: facebookAccountType, options: options) { (granted:Bool, error:Error?) in
            if granted{
                let accounts = accountStore.accounts(with: facebookAccountType)
                facebookAccount = accounts?.last as? ACAccount
                
                let credentials = facebookAccount?.credential
                let oauthToken = credentials?.oauthToken
            }
            else {
                if let err = error as? NSError, err.code == Int(ACErrorAccountNotFound.rawValue) {
                    DispatchQueue.main.async {
                        AppUtils.showErrorMessage("There is no Facebook accounts configured. you can add or created a Facebook account in your settings.")
                    }
                } else {
                    let err = error as? NSError
                    DispatchQueue.main.async {
                        AppUtils.showErrorMessage("Permission not granted For Your Application")
                    }
                }
            }
        }
    }
}

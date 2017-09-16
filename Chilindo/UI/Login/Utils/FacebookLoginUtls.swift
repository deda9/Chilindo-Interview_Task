//
//  FacebookLoginUtls.swift
//  elmenus
//
//  Created by Bassem.Qoulta on 9/10/17.
//  Copyright © 2017 Elmenus. All rights reserved.
//

import Accounts
import RxSwift

/**
 * Facebook Helper get the user access token with which call facebook graph to get the user data
 *
 */

protocol FacebookLogin{
    static func getUserFacebookAccessToken() -> Observable<String>
}

class FacebookLoginUtls: FacebookLogin{
    
    public static func getUserFacebookAccessToken() -> Observable<String> {
        return Observable.create{ observer -> Disposable in
            
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
                    if let oauthToken = credentials?.oauthToken {
                        observer.on(Event.next(oauthToken))
                        observer.onCompleted()
                    }
                }
                else {
                    if let err = error as? NSError {
                        observer.on(Event.error(err))
                    }
                }
            }
            return Disposables.create()
        }
    }
}

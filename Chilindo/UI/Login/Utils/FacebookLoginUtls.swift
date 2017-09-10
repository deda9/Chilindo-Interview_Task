//
//  FacebookLoginRequest.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import Accounts
import RxSwift

protocol FacebookLogin{
    func login() -> String?
}

class FacebookLoginUtls{
    
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
    
    func getFacebookUserData(){
        let oservable = FacebookLoginUtls.getUserFacebookAccessToken().flatMap{
            FacebookLoginRequest().login(accessToken: $0)
        }
        
        _ = oservable.subscribe(onNext: { user in
            print("user", user.email)
        }, onError: { error in
            print("eeeor")
            if let err = error as? NSError, err.code == Int(ACErrorAccountNotFound.rawValue) {
                AppUtils.showErrorMessage("There is no Facebook accounts configured. you can add or created a Facebook account in your settings.")
            }
        }, onCompleted: {
            print("onCompleted")
            
        })
        //.subscribe(onNext: { accessToken in
        //           print("acc", accessToken)
        //         }, onError: { error in
        //
        //         }, onCompleted: {
        //
        //         })
        //            FacebookLoginRequest()
        //                .login(accessToken: accessToken, onSuccess: { user in
        //                    UserDefaultsUtils.saveUserName(user.name)
        //                    UserDefaultsUtils.saveUserEmail(user.email)
        //                    UserDefaultsUtils.saveUserProfileUrl(self.getUserProfile(user))
        //                    UserDefaultsUtils.saveUserCoverUrl(user.cover?.source)
        //                }, onError: { error in
        //
        //                })
        //        }
    }
    
    //        static var mOauthToken: String?
    //
    //        let accountStore = ACAccountStore()
    //        var facebookAccount: ACAccount?
    //        let options:[String : Any] = [ACFacebookAppIdKey: Constants.FACEBOOK_API_KEY,
    //                                      ACFacebookPermissionsKey: ["email", "public_profile"]]
    //
    //        let facebookAccountType = accountStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierFacebook)
    //        accountStore.requestAccessToAccounts(with: facebookAccountType, options: options) { (granted:Bool, error:Error?) in
    //            if granted {
    //                let accounts = accountStore.accounts(with: facebookAccountType)
    //                facebookAccount = accounts?.last as? ACAccount
    //
    //                let credentials = facebookAccount?.credential
    //                let oauthToken = credentials?.oauthToken
    //
    //                DispatchQueue.main.async {
    //                    FacebookLoginUtls.mOauthToken = oauthToken
    //                }
    //
    //            }
    //            else {
    //                if let err = error as? NSError, err.code == Int(ACErrorAccountNotFound.rawValue) {
    //                    AppUtils.showErrorMessage("There is no Facebook accounts configured. you can add or created a Facebook account in your settings.")
    //                } else {
    //                    AppUtils.showErrorMessage("Permission not granted For Your Application")
    //                }
    //            }
    //        }
    //        return FacebookLoginUtls.mOauthToken
    //    }
}

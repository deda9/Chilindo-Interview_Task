//
//  FacebookLoginRequest.swift
//  elmenus
//
//  Created by Bassem.Qoulta on 9/10/17.
//  Copyright © 2017 Elmenus. All rights reserved.
//

import RxSwift
import Alamofire
/**
 *
 *Network class contain on user User logn with facebook calls
 *
 */
protocol FacebookNetworkLogin {
    
    func loginUserWithFacebook() -> Observable<User>
    
    func getFacebookUserData(accessToken: String) -> Observable<User>
}

class FacebookNetworkLoginRequest: BaseBackendRequest<User>, FacebookNetworkLogin {
    
    var mAccessToken: String = ""
    var subscribtion: Disposable?
    lazy var disposeBag = DisposeBag()
    
    func loginUserWithFacebook() -> Observable<User>{
        return FacebookLoginUtls.getUserFacebookAccessToken().flatMap{
            return self.getFacebookUserData(accessToken: $0)
        }
    }
    
    internal func getFacebookUserData(accessToken: String) -> Observable<User>{
        mAccessToken = accessToken
        return getResponseObject(url: Constants.FACEBOOK_API_URL)
    }
    
    /**
     * Add the parameters which facebook will need
     *
     */
    override func getParameters() -> Parameters {
        let parameters = ["access_token" : mAccessToken,
                          "fields"       : "email,name,picture,cover"
        ]
        return parameters
    }
    
    func cancelRequest(){
        subscribtion?.addDisposableTo(disposeBag)
    }
}

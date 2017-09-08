
//
//  FacebookLoginRequest.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire


class FacebookLoginRequest: BaseBackendRequest<User> {
    var disposeBag = DisposeBag()
    var mAccessToken: String = ""
    var subscribtion: Disposable?
    
    public func login(accessToken: String, onSuccess: @escaping (User) -> Void, onError: @escaping (NSError) -> ()){
        mAccessToken = accessToken
        subscribtion = getResponseObject(url: Constants.FACEBOOK_API_URL)
            .subscribe(onNext: { user in
                onSuccess(user)
                
            }, onError: { error in
                onError(error as NSError)
                
            }, onCompleted: {
                
            })
    }
    
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

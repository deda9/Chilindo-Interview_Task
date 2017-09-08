//
//  BaseBackendRequest.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import Foundation
import Alamofire
import RxAlamofire
import RxSwift
import ObjectMapper
import AlamofireObjectMapper

/**
 *
 * Base class for the alamofire network request
 * it contains two function one for get the response josn as array and
 * the other function for get the response as an Object
 *
 */
class BaseBackendRequest<T:Mappable>: NSObject{
    
    public func getResponseObject(url: String, debugResponse: Bool = true) -> Observable<T>{
        
        let url = URL(string: url)
        let alamofireRequest = RxAlamofire.request(getMethodType(),
                                                   url!, parameters: getParameters(),
                                                   encoding: JSONEncoding.default,
                                                   headers: getHeaders())
        
        let observable = alamofireRequest.flatMap{
            $0.rx_responseObject(type: T.self)
        }
        return observable
    }
    
    func getMethodType() -> HTTPMethod {
        return .post
    }
    
    func getHeaders() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        return headers
    }
    
    func getParameters() -> Parameters? {
        return nil
    }
    
    func onRequestSuccess(data: T?) {
        preconditionFailure("Override onRequestSuccess func ")
    }
    
    func onRequestSuccess(data: [T]?) {
        preconditionFailure("Override onRequestSuccess func ")
    }
    
    func onRequestFail() {
        preconditionFailure("Override onRequestFail func")
    }
    
    func onEmptyResponse() {
        //Override this function in sub class , when need to handle the empty data
    }
    
    func parseRequestHeader(_ fields: [String: String]?) {
        //Override this function in sub class , when need to parse the header info
    }
}

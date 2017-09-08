//
//  AlamofireDataRequestExtensions.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Alamofire
import ObjectMapper
import RxSwift

public typealias JSON = [String : Any]

public enum ObjectMapError: Error{
    case MapError(JSON?)
    case APIResponseError(Any?)
    
}

extension DataRequest{
    
    public func processMap<N>(mapObject:@escaping (AnyObject)-> N?) -> Observable<N>{
        return Observable.create{ (observer) -> Disposable in
            self.responseJSON(completionHandler: { (response : DataResponse<Any>) in
                switch response.result {
                case .success :
                    guard let o = mapObject(response.result.value! as AnyObject) else{
                        observer.on(Event.error(ObjectMapError.MapError(response.result.value as? JSON)))
                        return
                    }
                    observer.on(Event.next(o))
                    observer.onCompleted()
                    
                case .failure :
                    observer.on(Event.error(ObjectMapError.APIResponseError(response.result.value as? JSON)))
                }
            })
            return Disposables.create {
                self.cancel()
            }
        }
    }
    
    public func rx_responseArray<T:Mappable>(type:T.Type) -> Observable<[T]>{
        return self.processMap(mapObject: { (json) in
            Mapper<T>().mapArray(JSONArray: json as! [JSON])
        })
    }
    
    public func rx_responseObject<T:Mappable>(type:T.Type) -> Observable<T>{
        return self.processMap(mapObject: { (json) in
            Mapper<T>().map(JSON: json as! [String : Any] )
        })
    }
}


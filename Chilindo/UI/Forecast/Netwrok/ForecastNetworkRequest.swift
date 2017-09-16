//
//  ForecastNetworkRequest.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//
import RxSwift
import Alamofire
/**
 * Contians all the networkk methods for the forecast apis
 *
 */
class ForecastNetworkRequest: BaseBackendRequest<ForecastResponse> {
    
    var disposeBag = DisposeBag()
    var subscribtion: Disposable?
    var appKey = ""
    var late = ""
    var long = ""
    var tempUnits = ""
    
    public func getForecast(appKey: String, late: String, long: String, tempUnits: String, onSuccess: @escaping (ForecastResponse) -> Void, onError: @escaping (NSError) -> ()){
        
        self.appKey = appKey
        self.late = late
        self.long = long
        self.tempUnits = tempUnits
        
        subscribtion = getResponseObject(url: Constants.FORECAST_URL)
            .subscribe(onNext: { response in
                onSuccess(response)
                
            }, onError: { error in
                onError(error as NSError)
                
            }, onCompleted: {
                
            })
    }
    
    override func getParameters() -> Parameters {
        let parameters = ["appid" : appKey,
                          "lat"   : late,
                          "lon"   : long,
                          "units" : tempUnits,
                          ]
        return parameters
    }
    
    func cancelRequest(){
        subscribtion?.addDisposableTo(disposeBag)
    }
}

//
//  ForecastResponse.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import ObjectMapper

class ForecastResponse: Mappable{
    
    var city : City?
    var cnt : Int?
    var cod : String?
    var list : [ForecastItem]?
    var message : Float?
    
    required init?(map: Map){}
    
    func mapping(map: Map){
        city <- map["city"]
        cnt <- map["cnt"]
        cod <- map["cod"]
        list <- map["list"]
        message <- map["message"]
    }
}

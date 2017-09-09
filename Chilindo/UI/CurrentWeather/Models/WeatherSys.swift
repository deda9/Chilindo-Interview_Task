//
//  WeatherSys.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import ObjectMapper

class WeatherSys: Mappable{
    
    var country : String?
    var message : Float?
    var sunrise : Int?
    var sunset : Int?
    
    required init?(map: Map){}
    
    func mapping(map: Map){
        country <- map["country"]
        message <- map["message"]
        sunrise <- map["sunrise"]
        sunset <- map["sunset"]
    }
}

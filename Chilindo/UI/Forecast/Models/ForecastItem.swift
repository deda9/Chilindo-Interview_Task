//
//  ForecastList.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import ObjectMapper

class ForecastItem: Mappable{
    
    var clouds : Cloud?
    var dt : Int?
    var dtTxt : String?
    var main : WeatherData?
    var rain : Rain?
    var sys : WeatherSys?
    var weather : [WeatherState]?
    var wind : Wind?
    
    required init?(map: Map){}
    
    func mapping(map: Map){
        clouds <- map["clouds"]
        dt <- map["dt"]
        dtTxt <- map["dt_txt"]
        main <- map["main"]
        rain <- map["rain"]
        sys <- map["sys"]
        weather <- map["weather"]
        wind <- map["wind"]
    }
    
}

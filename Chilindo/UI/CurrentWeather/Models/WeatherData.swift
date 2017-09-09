//
//  Main.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//
import ObjectMapper

class WeatherData: Mappable{
    
    var grndLevel : Float?
    var humidity : Int?
    var pressure : Float?
    var seaLevel : Float?
    var temp : Float?
    var tempMax : Float?
    var tempMin : Float?
    
    required init?(map: Map){}
    
    func mapping(map: Map){
        grndLevel <- map["grnd_level"]
        humidity <- map["humidity"]
        pressure <- map["pressure"]
        seaLevel <- map["sea_level"]
        temp <- map["temp"]
        tempMax <- map["temp_max"]
        tempMin <- map["temp_min"]
    }
}

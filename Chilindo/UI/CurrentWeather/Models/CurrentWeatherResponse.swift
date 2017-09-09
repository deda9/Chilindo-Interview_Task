//
//  CurrentWeatherResponse.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import ObjectMapper

class CurrentWeatherResponse: Mappable{
    
    var base : String?
    var clouds : Cloud?
    var cod : Int?
    var coord : Coord?
    var dt : Int?
    var id : Int?
    var weatherData : WeatherData?
    var name : String?
    var weatherSys : WeatherSys?
    var weatherState : [WeatherState]?
    var wind : Wind?
    
    required init?(map: Map){}
    
    func mapping(map: Map){
        base <- map["base"]
        clouds <- map["clouds"]
        cod <- map["cod"]
        coord <- map["coord"]
        dt <- map["dt"]
        id <- map["id"]
        weatherData <- map["main"]
        name <- map["name"]
        weatherSys <- map["sys"]
        weatherState <- map["weather"]
        wind <- map["wind"]
    }
}

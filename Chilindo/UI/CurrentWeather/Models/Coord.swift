//
//  Coord.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//
import ObjectMapper

class Coord: Mappable{
    
    var lat : Float?
    var lon : Float?
    
    required init?(map: Map){}
    
    func mapping(map: Map){
        lat <- map["lat"]
        lon <- map["lon"]
    }
    
}

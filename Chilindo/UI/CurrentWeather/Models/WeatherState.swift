//
//  Weather.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import ObjectMapper

class WeatherState: Mappable{
    
    var descriptionField : String?
    var icon : String?
    var id : Int?
    var main : String?
    
    required init?(map: Map){}
    
    func mapping(map: Map){
        descriptionField <- map["description"]
        icon <- map["icon"]
        id <- map["id"]
        main <- map["main"]
    }
}

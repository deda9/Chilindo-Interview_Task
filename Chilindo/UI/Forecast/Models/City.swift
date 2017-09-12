//
//  City.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import ObjectMapper

class City: Mappable{
    
    var coord : Coord?
    var country : String?
    var id : Int?
    var name : String?
    var population : Int?
    
    required init?(map: Map){}
    
    func mapping(map: Map){
        coord <- map["coord"]
        country <- map["country"]
        id <- map["id"]
        name <- map["name"]
        population <- map["population"]
    }
}

//
//  Wind.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import ObjectMapper

class Wind: Mappable{
    
    var deg : Float?
    var speed : Float?
    
    required init?(map: Map){}
    
    func mapping(map: Map){
        deg <- map["deg"]
        speed <- map["speed"]
    }
    
}

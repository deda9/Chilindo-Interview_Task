//
//  UserCover.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import ObjectMapper

class UserCover :Mappable{
    
    var id : String?
    var offsetX : Int?
    var offsetY : Int?
    var source : String?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map){
        id <- map["id"]
        offsetX <- map["offset_x"]
        offsetY <- map["offset_y"]
        source <- map["source"]
    }
}

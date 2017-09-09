//
//  Cloud.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//
import ObjectMapper

class Cloud: Mappable{
    
    var all : Int?
    required init?(map: Map){}
    
    func mapping(map: Map){
        all <- map["all"]
    }
}


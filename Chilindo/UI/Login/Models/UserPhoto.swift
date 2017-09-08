//
//  UserPhoto.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import ObjectMapper

class UserPhoto: Mappable{
    
    var data : UserPhotoData?
    
    required init?(map: Map){
    }
    
    func mapping(map: Map){
        data <- map["data"]
    }
    
}

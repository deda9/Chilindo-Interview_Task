//
//  UserPhotoData.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//


import ObjectMapper

class UserPhotoData: Mappable{
    var isSilhouette : Bool?
    var url : String?
 
    required init?(map: Map){}
    
    func mapping(map: Map){
        isSilhouette <- map["is_silhouette"]
        url <- map["url"]
    }
}

//
//  User.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import ObjectMapper

class User: Mappable{
    
    var cover : UserCover?
    var email : String?
    var id : String?
    var name : String?
    var picture : UserPhoto?
    
    required init?(map: Map){}
    
    func mapping(map: Map){
        cover <- map["cover"]
        email <- map["email"]
        id <- map["id"]
        name <- map["name"]
        picture <- map["picture"]
    }
}

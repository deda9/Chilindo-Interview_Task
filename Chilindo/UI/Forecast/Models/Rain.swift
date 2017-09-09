//
//  Rain.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import ObjectMapper

class Rain: Mappable{
    
    var value: Float?
    
    required init?(map: Map){}
    
    func mapping(map: Map){
        value <- map["3h"]
    }
    
}

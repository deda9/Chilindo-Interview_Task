//
//  ForecastDate.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

public class ForecastDate: Hashable, Equatable{
    var dateText = ""
    var dateTimeText = ""
    
    public var hashValue:Int {
        return dateText.hashValue
    }
    
    public static func == (lhs: ForecastDate, rhs: ForecastDate) -> Bool{
        return (lhs.dateText == rhs.dateText) 
    }
}

//
//  ForecastResponseParser.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation

class ForecastResponseParser{
    
    public static func getDaysWithForecastItemList(_ response: ForecastResponse) -> [ForecastDate: [ForecastItem] ]{
        var daysWithForecastItems =  [ForecastDate: [ForecastItem] ]()
        
        guard let forecastItems = response.list , (response.list?.count)! > 0 else {
            return daysWithForecastItems
        }
        
        for item in forecastItems {
            let dateText = item.dtTxt
            let dateComponents = dateText?.components(separatedBy: " ")
            
            if let dateComponents = dateComponents, dateComponents.count > 1 {
                
                let forecastDate = ForecastDate()
                forecastDate.dateText = dateComponents[0]
                forecastDate.dateTimeText = dateComponents[1]
                
                var forecastDateIsFoundBefore = daysWithForecastItems[forecastDate]
                if(forecastDateIsFoundBefore != nil){ // then append this item to the old list of the forecast items
                    forecastDateIsFoundBefore?.append(item)
                    daysWithForecastItems[forecastDate] = forecastDateIsFoundBefore
                    
                }else{ // add new forecast item to the date
                    var forecateList = [ForecastItem]()
                    forecateList.append(item)
                    daysWithForecastItems[forecastDate] = forecateList
                }
            }
        }
        
        return daysWithForecastItems
    }
}

//
//  ForecastTabsViewController.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//


import UIKit
import XLPagerTabStrip

class ForecastTabsViewController: ButtonBarPagerTabStripViewController {
    
    var daysWithForecastItemList: [ForecastDate: [ForecastItem]]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getForecast()
    }
    
    func getForecast(){
        Location.getLocation(accuracy: .room, frequency: .oneShot, success: { (_, location) -> (Void) in
            let late = String(location.coordinate.latitude)
            let long = String(location.coordinate.longitude)
            
            print(late)
            print(long)
            
            ForecastNetworkRequest().getForecast(appKey: Constants.WEATHER_APP_KEY,
                                                 late: late,
                                                 long: long,
                                                 tempUnits: "imperial",
                                                 onSuccess: { (response) in
                                                    self.setForecastData(response)
            },
                                                 onError: { error in })
            
        }) { (request, lastLocation, error) -> (Void) in
            request.cancel()
            AppUtils.showErrorMessage("Location monitoring failed due to an error \(error)")
        }
    }
    
    func setForecastData(_ response: ForecastResponse){
        daysWithForecastItemList = ForecastResponseParser.getDaysWithForecastItemList(response)
        reloadPagerTabStripView()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        var tabViewsList = [UIViewController]()
        guard daysWithForecastItemList != nil else{
            tabViewsList.append(ForecastListViewController())
            return tabViewsList
        }
        
         for (date, forecastList) in daysWithForecastItemList {
            print("date", date.dateText ,"  ",  forecastList.count)
            tabViewsList.append(ForecastListViewController())
            
        }
        return tabViewsList
    }
}

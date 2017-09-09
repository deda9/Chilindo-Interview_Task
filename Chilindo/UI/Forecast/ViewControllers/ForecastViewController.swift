//
//  ForecastViewController.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//


import UIKit

class ForecastViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getForecast()
    }

    override func viewWillAppear(_ animated: Bool) {
        setTitle()
    }
    
    func setTitle(){
        navigationItem.title = "ForeCast"
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
        let daysWithForecastItemList = ForecastResponseParser.getDaysWithForecastItemList(response)
        for (date, forecastList) in daysWithForecastItemList {
            print("date", date.dateText ,"  ",  forecastList.count)
        }
    }
}

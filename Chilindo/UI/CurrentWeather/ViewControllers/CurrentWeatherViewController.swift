//
//  CurrentWeatherViewController.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//



import UIKit

class CurrentWeatherViewController: BaseWeatherViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentWeather()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTitle()
    }
    
    func setTitle(){
        navigationItem.title = "Current Weather"
    }
    
    func getCurrentWeather(){
        Location.getLocation(accuracy: .room, frequency: .oneShot, success: { (_, location) -> (Void) in
            let late = String(location.coordinate.latitude)
            let long = String(location.coordinate.longitude)
            
            print(late)
            print(long)
            
            CurrentWeatherNetworkRequest().getCurrentWeather(appKey: Constants.WEATHER_APP_KEY,
                                                             late: late,
                                                             long: long,
                                                             tempUnits: "imperial",
                                                             onSuccess: { (response) in
                                                                self.setCurrentWeatherData(response)
            },
                                                             onError: { error in })
            
        }) { (request, lastLocation, error) -> (Void) in
            request.cancel()
            AppUtils.showErrorMessage("Location monitoring failed due to an error \(error)")
        }
    }
    
    func setCurrentWeatherData(_ response: CurrentWeatherResponse){
        setPressure(response.weatherData)
        setTemp(response.weatherData)
        setHudimity(response.weatherData)
        setMinTemp(response.weatherData)
        setMaxTemp(response.weatherData)
        setSeaLevel(response.weatherData)
        setGrandLevel(response.weatherData)
        setWindSpeeed(response.wind)
        setWeatherSys(response.weatherSys)
        setWeatherState(response.weatherState)
    }
    
}

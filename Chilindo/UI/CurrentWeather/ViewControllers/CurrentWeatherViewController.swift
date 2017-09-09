//
//  CurrentWeatherViewController.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//



import UIKit

class CurrentWeatherViewController: BaseViewController {
    
    @IBOutlet weak var weatherStateImageView: UIImageView!
    @IBOutlet weak var weatherStateLabel: UILabel!
    @IBOutlet weak var countryValueLabel: UILabel!
    @IBOutlet weak var tempValueLabel: UILabel!
    @IBOutlet weak var pressureValueLabel: UILabel!
    @IBOutlet weak var humidityValueLabel: UILabel!
    @IBOutlet weak var minTemoValueLabel: UILabel!
    @IBOutlet weak var maxTemoValueLabel: UILabel!
    @IBOutlet weak var seaLevelValueLabel: UILabel!
    @IBOutlet weak var grandLevelValueLabel: UILabel!
    @IBOutlet weak var windSpeedValueLabel: UILabel!
    
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
        if let pressure = response.weatherData?.pressure{
            pressureValueLabel.text = String(pressure)
        }else{
            pressureValueLabel.text = "-"
        }
        
        if let temp = response.weatherData?.temp{
            tempValueLabel.text = String(temp)
        }else{
            tempValueLabel.text = "-"
        }
        
        if let humidity = response.weatherData?.humidity{
            humidityValueLabel.text = String(humidity)
        }else{
            humidityValueLabel.text = "-"
        }
        
        
        if let mintTemp = response.weatherData?.tempMin{
            minTemoValueLabel.text = String(mintTemp)
        }else{
            minTemoValueLabel.text = "-"
        }
        
        if let maxTemp = response.weatherData?.tempMax{
            maxTemoValueLabel.text = String(maxTemp)
        }else{
            maxTemoValueLabel.text = "-"
        }
        
        if let seaLevel = response.weatherData?.seaLevel{
            seaLevelValueLabel.text = String(seaLevel)
        }else{
            seaLevelValueLabel.text = "-"
        }
        
        if let grandLevel = response.weatherData?.grndLevel{
            grandLevelValueLabel.text = String(grandLevel)
        }else{
            grandLevelValueLabel.text = "-"
        }
        
        if let windSpeed = response.wind?.speed{
            windSpeedValueLabel.text = String(windSpeed) + " m/s"
        }else{
            windSpeedValueLabel.text = "-"
        }
        
        if let country = response.weatherSys?.country{
            countryValueLabel.text = country
        }else{
            countryValueLabel.text = "-"
        }
        
        guard (response.weatherState != nil), !(response.weatherState?.isEmpty)! else {
            weatherStateLabel.text = "-"
            return
        }
        
        if let weatherState = response.weatherState?[0].descriptionField{
            weatherStateLabel.text = weatherState
        }else{
            weatherStateLabel.text = "-"
        }
        
    }
    
}

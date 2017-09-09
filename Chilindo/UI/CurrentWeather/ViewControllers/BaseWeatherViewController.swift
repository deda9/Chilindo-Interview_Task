//
//  BaseWeatherViewController.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit

class BaseWeatherViewController: BaseViewController {
    
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
    }
    
    func setPressure(_ weatherData: WeatherData?){
        if let pressure = weatherData?.pressure{
            pressureValueLabel.text = String(pressure)
        }else{
            pressureValueLabel.text = "-"
        }
    }
    
    func setTemp(_ weatherData: WeatherData?){
        if let temp = weatherData?.temp{
            tempValueLabel.text = String(temp)
        }else{
            tempValueLabel.text = "-"
        }
    }
    
    func setHudimity(_ weatherData: WeatherData?){
        if let humidity = weatherData?.humidity{
            humidityValueLabel.text = String(humidity)
        }else{
            humidityValueLabel.text = "-"
        }
    }
    
    func setMinTemp(_ weatherData: WeatherData?){
        if let mintTemp = weatherData?.tempMin{
            minTemoValueLabel.text = String(mintTemp)
        }else{
            minTemoValueLabel.text = "-"
        }
    }
    
    func setMaxTemp(_ weatherData: WeatherData?){
        if let maxTemp = weatherData?.tempMax{
            maxTemoValueLabel.text = String(maxTemp)
        }else{
            maxTemoValueLabel.text = "-"
        }
    }
    
    func setSeaLevel(_ weatherData: WeatherData?){
        if let seaLevel = weatherData?.seaLevel{
            seaLevelValueLabel.text = String(seaLevel)
        }else{
            seaLevelValueLabel.text = "-"
        }
    }
    
    func setGrandLevel(_ weatherData: WeatherData?){
        if let grandLevel = weatherData?.grndLevel{
            grandLevelValueLabel.text = String(grandLevel)
        }else{
            grandLevelValueLabel.text = "-"
        }
    }
    
    func setWindSpeeed(_ wind: Wind?){
        if let windSpeed = wind?.speed{
            windSpeedValueLabel.text = String(windSpeed) + " m/s"
        }else{
            windSpeedValueLabel.text = "-"
        }
    }
    
    func setWeatherSys(_ weatherSys: WeatherSys?){
        if let country = weatherSys?.country{
            countryValueLabel.text = country
        }else{
            countryValueLabel.text = "-"
        }
    }
    
    func setWeatherState(_ weatherState: [WeatherState]?){
        guard (weatherState != nil), !(weatherState?.isEmpty)! else {
            weatherStateLabel.text = "-"
            return
        }
        
        if let weatherState = weatherState?[0].descriptionField{
            weatherStateLabel.text = weatherState
        }else{
            weatherStateLabel.text = "-"
        }
        
    }
}

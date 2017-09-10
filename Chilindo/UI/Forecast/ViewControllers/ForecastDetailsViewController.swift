//
//  ForecastDetailsViewController.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit

class ForecastDetailsViewController: BaseWeatherViewController {

    var forecastItem: ForecastItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Details"
        
        if(forecastItem != nil){
            setPressure(forecastItem?.main)
            setTemp(forecastItem?.main)
            setHudimity(forecastItem?.main)
            setMinTemp(forecastItem?.main)
            setMaxTemp(forecastItem?.main)
            setSeaLevel(forecastItem?.main)
            setGrandLevel(forecastItem?.main)
            setWindSpeeed(forecastItem?.wind)
            setWeatherSys(forecastItem?.sys)
            setWeatherState(forecastItem?.weather)
        }
    }

}

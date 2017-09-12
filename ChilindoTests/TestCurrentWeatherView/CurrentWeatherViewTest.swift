//
//  CurrentWeatherViewTest.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/12/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Quick
import Nimble
import ObjectMapper

@testable import Chilindo

class CurrentWeatherViewTest: QuickSpec {
    
    override func spec(){
        var sut: CurrentWeatherViewController!
        
        beforeEach {
            sut = CurrentWeatherViewController(nibName: "BaseWeatherView", bundle: nil)
        }
        
        describe("viewDidLoad()"){
            beforeEach {
                _ = sut.view
            }
            
            it("set inital tempValueLabel to - "){
                let tempValueLabel = sut!.tempValueLabel
                expect(tempValueLabel?.text).to(equal("-"))
              
            }
            
            describe("test view when data came "){
                var sutResponse: CurrentWeatherResponse!
                beforeEach {
                    sutResponse = self.getCurrentWeatherResponseMock()
                    sut.setCurrentWeatherData(sutResponse)
                }
                
                it("temp value "){
                    expect(sut.tempValueLabel.text).to(equal("57.52"))
                }
                
                it("Country value "){
                    expect(sut.countryValueLabel.text).to(equal("GB"))
                }
                
                it("weatherStateLabel value "){
                    expect(sut.weatherStateLabel.text).to(equal("light intensity shower rain"))
                }
                
                it("pressureValueLabel value "){
                    expect(sut.pressureValueLabel.text).to(equal("1003.0"))
                }
                
                it("humidityValueLabel value "){
                    expect(sut.humidityValueLabel.text).to(equal("63"))
                }
                
                it("minTemoValueLabel value "){
                    expect(sut.minTemoValueLabel.text).to(equal("55.4"))
                }
                
                it("maxTemoValueLabel value "){
                    expect(sut.maxTemoValueLabel.text).to(equal("60.8"))
                }
                
                it("seaLevelValueLabel value "){
                    expect(sut.seaLevelValueLabel.text).to(equal("-"))
                }
                
                it("windSpeedValueLabel value "){
                    expect(sut.windSpeedValueLabel.text).to(equal("16.11 m/s"))
                }
            }
        }
    }
    
    func getCurrentWeatherResponseMock() -> CurrentWeatherResponse?{
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "currentWeather", ofType: "json")
        let pathUrl = "file://" + path!
        do {
            let jsonData = try Data(contentsOf: NSURL.init(string: pathUrl) as! URL, options: .alwaysMapped)
            guard let json = try? JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) else {
                return nil
            }
            return  Mapper<CurrentWeatherResponse>().map(JSON: json as! [String : Any])
            
        }catch(let error){
            print (error.localizedDescription)
        }
        return nil
    }
    
}

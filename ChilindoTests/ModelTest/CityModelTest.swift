//
//  CityModelTest.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/12/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Quick
import Nimble
import ObjectMapper
@testable import Chilindo

class CityModelTest: QuickSpec {
    
    override func spec(){
        describe("test initialization"){
            var city: City!
            beforeEach {
                let json = "{\"id\" : 1, \"country\" : \"EG\",\"coord\" : {\"lat\": 9.0, \"lon\" : 8.0}}"
                
                city = Mapper<City>().map(JSONString: json)
            }
            
            it("test id"){
                expect(city.id).to(equal(1))
            }
            
            it("test county"){
                expect(city.country).to(equal("EG"))
            }
            
            it("test late coord"){
                expect(city.coord?.lat).to(equal(9.0))
            }
        }
    }
    
}

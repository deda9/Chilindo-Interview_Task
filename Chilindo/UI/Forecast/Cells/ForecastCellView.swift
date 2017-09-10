//
//  ForecastCellView.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/10/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit

class ForecastCellView: UITableViewCell {
    
    public static let IDENTIFIRE = "ForecastCellView"

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var temlLabel: UILabel!
    @IBOutlet weak var weatherStateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCellData(_ item: ForecastItem){
        guard  !(item.weather?.isEmpty)! else {
            weatherStateLabel.text = "-"
            return
        }
        
        if let weatherState = item.weather?[0].descriptionField{
            weatherStateLabel.text = weatherState + " °F"
        }else{
            weatherStateLabel.text = "-"
        }
        
        if let temp = item.main?.temp{
            temlLabel.text = String(temp)
        }else{
            temlLabel.text = "-"
        }
        
        if let dateText = item.dtTxt{
            let timeArray = dateText.components(separatedBy: " ")
            if(timeArray.count > 1){
                timeLabel.text = timeArray[1]
            }
        }else{
            timeLabel.text = "-"
        }
    }

}

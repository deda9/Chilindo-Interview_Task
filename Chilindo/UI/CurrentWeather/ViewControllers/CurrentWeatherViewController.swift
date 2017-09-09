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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setTitle()
    }
    
    func setTitle(){
        navigationItem.title = "Current Weather"
    }
}

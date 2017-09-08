//
//  HomeViewController.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit

class HomeViewController: MenuContainerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let navigationMenuViewController = NavigationMenuViewController(nibName: "MenuNavigationView", bundle: nil)
        navigationMenuViewController.menuItems = getMenuItem()
        menuViewController = navigationMenuViewController as MenuViewController
        contentViewControllers = contentControllers()
        selectContentViewController(contentViewControllers.first!)
    }

    private func  getMenuItem() -> [MenuItem]{
        var menuItemArray = [MenuItem]()
        
        var profileHeader = MenuItem()
        profileHeader.email = "Bassem"
        profileHeader.type = MenuItemType.ProfileHeader
        menuItemArray.append(profileHeader)
        
        var currentWeather = MenuItem()
        currentWeather.type = MenuItemType.TitledItem
        currentWeather.title = "Current Weather"
        menuItemArray.append(currentWeather)
        
        var forecast = MenuItem()
        forecast.type = MenuItemType.TitledItem
        forecast.title = "Forecast"
        menuItemArray.append(forecast)
        
        return menuItemArray
    }
    
    private func contentControllers() -> [UIViewController] {
        var contentList = [UIViewController]()
        contentList.append(ForecastViewController(nibName: "ForecastView", bundle: nil))
        contentList.append(CurrentWeatherViewController(nibName: "CurrentWeatherView", bundle: nil))
        return contentList
    }
}

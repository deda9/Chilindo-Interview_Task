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
        selectContentViewController(contentViewControllers.first!, title: "Current Weather")
    }

    private func  getMenuItem() -> [MenuItem]{
        var menuItemArray = [MenuItem]()
        
        var profileHeader = ProfileHeaderMenuItem()
        profileHeader.email = "Bassem"
        profileHeader.type = MenuItemType.ProfileHeader
        menuItemArray.append(profileHeader)
        
        var currentWeather = TitledMenuItem()
        currentWeather.type = MenuItemType.TitledItem
        currentWeather.title = "Current Weather"
        currentWeather.iconImageViewName  = "CurrentWeather"
        menuItemArray.append(currentWeather)
        
        var forecast = TitledMenuItem()
        forecast.type = MenuItemType.TitledItem
        forecast.title = "Forecast"
        forecast.iconImageViewName = "Forecast"
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

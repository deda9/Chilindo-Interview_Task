//
//  ForecastTabsViewController.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//


import UIKit
import XLPagerTabStrip
import Cartography

class ForecastTabsViewController: ButtonBarPagerTabStripViewController {
    
    var daysWithForecastItemList: [ForecastDate: [ForecastItem]]!
    var dialogFullScreenView: UIView?
    var dialogLoadingGroup: STLoadingGroup?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getForecast()
    }
    
    func getForecast(){
        showProgressDialog()
        Location.getLocation(accuracy: .room, frequency: .oneShot, success: { (_, location) -> (Void) in
            let late = String(location.coordinate.latitude)
            let long = String(location.coordinate.longitude)
            
            print(late)
            print(long)
            
            ForecastNetworkRequest().getForecast(appKey: Constants.WEATHER_APP_KEY,
                                                 late: late,
                                                 long: long,
                                                 tempUnits: "imperial",
                                                 onSuccess: {[weak self] (response) in
                                                    self?.setForecastData(response)
                                                    self?.hideProgressDialog()
            },
                                                 onError: { [weak self ]error in
                                                    self?.hideProgressDialog()
            })
            
        }) { [weak self ](request, lastLocation, error) -> (Void) in
            request.cancel()
            self?.hideProgressDialog()
            AppUtils.showErrorMessage("Location monitoring failed due to an error \(error)")
        }
    }
    
    func setForecastData(_ response: ForecastResponse){
        daysWithForecastItemList = ForecastResponseParser.getDaysWithForecastItemList(response)
        reloadPagerTabStripView()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        var tabViewsList = [UIViewController]()
        guard daysWithForecastItemList != nil else{
            tabViewsList.append(ForecastListViewController())
            return tabViewsList
        }
        
         for (date, forecastList) in daysWithForecastItemList {
            let view = ForecastListViewController(nibName: "ForecastListView", bundle: nil)
            view.tabTitle = date.dateText
            view.forecastItemList = forecastList
            tabViewsList.append(view)
            
        }
        return tabViewsList
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    public func showProgressDialog(){
        dialogLoadingGroup = STLoadingGroup(side: 80, style: .arch)
        
        if dialogFullScreenView == nil {
            dialogFullScreenView = UIView(frame: self.view.frame)
            dialogFullScreenView?.backgroundColor = UIColor(red: 0.0, green: 0.0, blue:0.0, alpha: 0.3)
        }
        
        if !(dialogFullScreenView?.isDescendant(of: self.view))!{
            self.view.addSubview(dialogFullScreenView!)
            constrain(dialogFullScreenView!) { view in
                view.edges == view.superview!.edges
            }
        }
        
        dialogLoadingGroup?.show(dialogFullScreenView)
        dialogLoadingGroup?.startLoading()
    }
    
    public func hideProgressDialog(){
        dialogLoadingGroup?.stopLoading()
        dialogFullScreenView?.removeFromSuperview()
    }
}

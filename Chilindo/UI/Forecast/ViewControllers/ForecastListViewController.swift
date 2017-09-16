//
//  ForecastListViewController.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit
import XLPagerTabStrip
/**
 * Forecast days list
 *
 */
class ForecastListViewController: BaseViewController, IndicatorInfoProvider {
    
    var tabTitle = "View"
    var forecastItemList: [ForecastItem]!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupCellNibRegistration(nibName: ForecastCellView.IDENTIFIRE)
    }
    
    /**
     * Table setup
     *
     */
    func setupCellNibRegistration(nibName: String?) -> Void {
        assert((self.nibName != nil) && !(self.nibName?.isEmpty)!, "Cell nib name, Override setupCellNibName Func ")
        let cellNib = UINib.init(nibName: nibName!, bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: nibName!)
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: tabTitle)
    }
}

extension ForecastListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard forecastItemList != nil && forecastItemList.count > 0 else {
            return 0
        }
        return forecastItemList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard forecastItemList != nil && forecastItemList.count > 0 else {
            return UITableViewCell()
        }
        let index = indexPath.row
        let menuItem = forecastItemList[index]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ForecastCellView.IDENTIFIRE, for: indexPath) as! ForecastCellView
        cell.updateCellData(menuItem)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let index = indexPath.row
        let item = forecastItemList[index]
        let view = ForecastDetailsViewController(nibName: "BaseWeatherView", bundle: nil)
        view.forecastItem = item
        self.navigationController?.pushViewController(view, animated: true)
    }
}

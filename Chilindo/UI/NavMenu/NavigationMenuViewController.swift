//
// NavigationMenuViewController.swift
//
// Copyright 2017 Handsome LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit

/*
 Menu controller is responsible for creating its content and showing/hiding menu using 'menuContainerViewController' property.
 */
class NavigationMenuViewController: MenuViewController {
    
    var menuItems:[MenuItem]!
    
    @IBOutlet weak var tableView: UITableView!
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setupCellNibRegistration(nibName: UserInfoHeaderViewCell.IDENTIFIRE)
        setupCellNibRegistration(nibName: MenuItemNameViewCell.IDENTIFIRE)
        
        tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: UITableViewScrollPosition.none)
    }
    
    func setupCellNibRegistration(nibName: String?) -> Void {
        assert((self.nibName != nil) && !(self.nibName?.isEmpty)!, "Cell nib name, Override setupCellNibName Func ")
        let cellNib = UINib.init(nibName: nibName!, bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: nibName!)
    }
}

/*
 Extention of `NavigationMenuViewController` class, implements table view delegates methods.
 */
extension NavigationMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = indexPath.row
        let menuItem = menuItems[index]
        
        if(menuItem.type == MenuItemType.ProfileHeader){
            return 236
        }else{
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let menuItem = menuItems[index]
        
        if(menuItem.type == MenuItemType.ProfileHeader){
            if let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoHeaderViewCell.IDENTIFIRE, for: indexPath) as? UserInfoHeaderViewCell {
                cell.updateCellData(menuItem)
                tableView.allowsSelection = false
                return cell
            }
        }else{
            if let cell = tableView.dequeueReusableCell(withIdentifier: MenuItemNameViewCell.IDENTIFIRE, for: indexPath) as? MenuItemNameViewCell {
                cell.updateCellData(menuItem)
                tableView.select = true
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let menuContainerViewController = self.menuContainerViewController else {
            return
        }
        
        menuContainerViewController.selectContentViewController(menuContainerViewController.contentViewControllers[indexPath.row - 1])
        menuContainerViewController.hideSideMenu()
    }
}

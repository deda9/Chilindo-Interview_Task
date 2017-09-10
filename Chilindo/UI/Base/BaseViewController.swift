//
//  BaseViewController.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        showNavigationBar()
        customNavigationBarColor()
        hideNavigationBottomLine()
    }
    
    func addMenuIconOnNavigationBar() -> Void {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "Menu" as String), for: .normal)
        button.addTarget(self, action: #selector(openLeftMenu), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 17.0, height: 15)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    func openLeftMenu(){
        // can override this in sub class
    }
    
    public func customNavigationBarColor(){
        navigationController?.navigationBar.barTintColor = UIColor.black
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        navigationController?.navigationBar.isTranslucent = false
    }
    
    public func hideNavigationBottomLine() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    public func hideNavigationBar(){
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    public func showNavigationBar(){
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

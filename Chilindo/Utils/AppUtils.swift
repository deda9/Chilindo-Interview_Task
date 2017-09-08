//
//  AppUtils.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit
import SwiftMessages

class AppUtils {
    
    public static func showSuccessMessage(_ message: String){
        let view = MessageView.viewFromNib(layout: .CardView)
        view.configureTheme(.success)
        view.configureDropShadow()
        view.button?.removeFromSuperview()
        view.configureContent(title: EventUtils.localizedString(forKey: "successTitle"), body: message)
        
        let config = getShowMessageConfig()
        SwiftMessages.show(config: config, view: view)
    }
    
    public static func showErrorMessage(_ message: String){
        let view = MessageView.viewFromNib(layout: .CardView)
        view.configureTheme(.error)
        view.configureDropShadow()
        view.button?.removeFromSuperview()
        view.configureContent(title: EventUtils.localizedString(forKey: "errorTitle"), body: message)
        let config = getShowMessageConfig()
        SwiftMessages.show(config: config, view: view)
    }
    
    private static func getShowMessageConfig() -> SwiftMessages.Config{
        var config = SwiftMessages.Config()
        config.presentationStyle = .top
        config.presentationContext = .window(windowLevel: UIWindowLevelStatusBar)
        config.dimMode = .gray(interactive: true)
        config.interactiveHide = true
        return config
    }
}

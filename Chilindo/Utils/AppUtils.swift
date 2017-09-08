//
//  AppUtils.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit
import SwiftMessages
import Kingfisher

class AppUtils {
    
    public static func showSuccessMessage(_ message: String){
        let view = MessageView.viewFromNib(layout: .CardView)
        view.configureTheme(.success)
        view.configureDropShadow()
        view.button?.removeFromSuperview()
        view.configureContent(title: "Success", body: message)
        
        let config = getShowMessageConfig()
        SwiftMessages.show(config: config, view: view)
    }
    
    public static func showErrorMessage(_ message: String){
        let view = MessageView.viewFromNib(layout: .CardView)
        view.configureTheme(.error)
        view.configureDropShadow()
        view.button?.removeFromSuperview()
        view.configureContent(title: "Error", body: message)
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
    
    public static func downloadImage(path: String?, placeholder: UIImage, into imageView: UIImageView, indicator: UIActivityIndicatorView?) -> Void {
        
        ImageCache.default.maxDiskCacheSize = UInt(50 * 1024 * 1024)
        
        let url = URL(string: path!)
        let resource = ImageResource(downloadURL: url!, cacheKey: nil)
        imageView.kf.setImage(with: resource,
                              placeholder: placeholder,
                              options: nil, progressBlock: nil) { (image, error, disk, url) in
                                indicator?.removeFromSuperview()
        }
    }

}

//
//  RoundButton.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable public class RoundButton: UIButton {
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.white{
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 8
        clipsToBounds = true
    }
    
}

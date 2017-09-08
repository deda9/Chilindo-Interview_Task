//
//  RoundedImageView.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit

@IBDesignable class RoundedImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let roundValue = min(frame.height / 2, frame.width / 2)
        layer.cornerRadius = roundValue
        clipsToBounds =  true
    }
    
}

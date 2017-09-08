//
//  MenuItemNameViewCell.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit

class MenuItemNameViewCell: UITableViewCell {

    public static let IDENTIFIRE = "MenuItemNameViewCell"

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
    }
    
    func updateCellData(_ item: MenuItem){
        let titledItem = item as! TitledMenuItem
    
        titleLabel.text = titledItem.title
        iconImageView.image = UIImage(named: titledItem.iconImageViewName)
    }

}

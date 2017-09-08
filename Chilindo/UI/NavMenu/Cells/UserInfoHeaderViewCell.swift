//
//  UserInfoHeaderViewCell.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit

class UserInfoHeaderViewCell: UITableViewCell {

    public static let IDENTIFIRE = "UserInfoHeaderViewCell"

    @IBOutlet weak var profileImageView: RoundedImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emialLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCellData(_ item: MenuItem){
        userNameLabel.text = item.userName
        emialLabel.text = item.email
    }

}

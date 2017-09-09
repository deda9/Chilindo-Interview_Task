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

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var profileImageView: RoundedImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emialLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.clear
    }
    
    func updateCellData(_ item: MenuItem){
        let userInfoModel = item as! ProfileHeaderMenuItem
    
        userNameLabel.text = userInfoModel.userName
        emialLabel.text = userInfoModel.email
        
        AppUtils.downloadImage(path: userInfoModel.profileImageUrl,
                               placeholder: UIImage(named: "Avatar")!,
                               into: profileImageView,
                               indicator: nil)
        
        AppUtils.downloadImage(path: userInfoModel.backgroundImageUrl,
                               placeholder: UIImage(named: "Cover")!,
                               into: backgroundImageView,
                               indicator: nil)
    }

}

//
//  File.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/8/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//
//
import Foundation

enum MenuItemType: String{
    case ProfileHeader = "ProfileHeader"
    case TitledItem = "TitledItem"
}

protocol MenuItem {
    var type:MenuItemType {get set};
}


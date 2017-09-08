//
//  UserDefaultsUtils.swift
//  Chilindo
//
//  Created by Bassem Qoulta on 9/9/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import Foundation

class UserDefaultsUtils{
    
    private static let USER_NAME = "user_name"
    private static let USER_EMAIL = "user_email"
    private static let USER_PROFILE_URL = "user_profile"
    private static let USER_COVER_URL = "user_cover"
    
    public static func saveUserName(_ name: String?){
        let userDefault = UserDefaults.standard
        userDefault.set(name, forKey: USER_NAME)
        userDefault.synchronize()
    }
    
    public static func getUserName() -> String{
        let userDefault = UserDefaults.standard
        if let token = userDefault.value(forKey: USER_NAME){
            return token as! String
        }else{
            return "NONE"
        }
    }
    
    
    public static func saveUserEmail(_ email: String?){
        let userDefault = UserDefaults.standard
        userDefault.set(email, forKey: USER_EMAIL)
        userDefault.synchronize()
    }
    
    public static func getUserEmail() -> String{
        let userDefault = UserDefaults.standard
        if let token = userDefault.value(forKey: USER_EMAIL){
            return token as! String
        }else{
            return "NONE"
        }
    }
    
    public static func saveUserProfileUrl(_ profileUrl: String?){
        let userDefault = UserDefaults.standard
        userDefault.set(profileUrl, forKey: USER_PROFILE_URL)
        userDefault.synchronize()
    }
    
    public static func getUserProfileUrl() -> String{
        let userDefault = UserDefaults.standard
        if let token = userDefault.value(forKey: USER_PROFILE_URL){
            return token as! String
        }else{
            return "NONE"
        }
    }
    
    public static func saveUserCoverUrl(_ coverUrl: String?){
        let userDefault = UserDefaults.standard
        userDefault.set(coverUrl, forKey: USER_COVER_URL)
        userDefault.synchronize()
    }
    
    public static func getUserCoverUrl() -> String{
        let userDefault = UserDefaults.standard
        if let token = userDefault.value(forKey: USER_COVER_URL){
            return token as! String
        }else{
            return "NONE"
        }
    }
}

//
//  FBLoginManager.swift
//  CrownIt
//
//  Created by Nikhil Bansal on 16/11/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
//

import UIKit

@objc
class FBLoginManager: NSObject {
    static let shared = FBLoginManager()
    
    var accessToken:String?
    
    override init() {
        super.init()
        accessToken = getToken()
    }
    
    public func saveToken(){
        let userdefault = UserDefaults.standard
        userdefault.set(accessToken, forKey: "AccessToken")
        userdefault.synchronize()
    }
    
    private func getToken() -> String?{
        let userdefault = UserDefaults.standard
        let token = userdefault.object(forKey: "AccessToken")
        
        return token as? String
    }
}

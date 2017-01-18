//
//  AppUtils.swift
//  til2
//
//  Created by Hitesh Kumar on 27/05/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

import UIKit

class AppUtils: NSObject {
    
    class func getAppVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }

    static func getStringFromAnyType(_ valueObj:Any?) -> String {
        var str:String?
        
        if ValidationUtils.isObjectValid(valueObj) {
            if valueObj is String {
                str = valueObj as? String
            }else{
                str =  String(describing: valueObj!)
            }
        }
        if str == nil || str! == "nil"  {
            return ""
        }
        return str!
    }
    
}

//
//  APIConstants.swift
//  til2
//
//  Created by Hitesh Kumar on 27/05/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

import UIKit

enum APIType:String{

    case home, categories

}

@objc class APIConstants: NSObject {
    
    static let ApiVersionKey = "Api-version"
    static let ApiVersionValue = "1"
    
    static let PlatformKey = "platform"
    static let PlatformValue = "ios"
    
    static let AppVersionKey = "app-version"
    
//MARK: Dev
    #if TEST_ENV
    static let  baseServerURL = "https://tuneinlife.com/api/"
    static let  baseNodeServerURL = "https://tuneinlife.com/api/"
    
    #else
//MARK: Production
    static let  baseServerURL = "https://tuneinlife.com/api/"
    static let  baseNodeServerURL = "https://tuneinlife.com/api/"
    #endif
    
    /// get API url
    
    static func getAPIUrl(_ apiType:APIType)->String{
        switch (apiType){
        case .home:
            return "home-data"
        default:
            return ""
      

        }
    }
    struct CategoryAPIConstants {
    
        static let catName = "catName"
        static let catCount = "catCount"
        static let catImage = "catImage"
        static let catDate = "catDate"
    }
    
    
}

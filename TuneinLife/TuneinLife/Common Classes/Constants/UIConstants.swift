//
//  UIConstants.swift
//  til2
//
//  Created by hitesh on 14/06/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

import UIKit

@objc enum  Storyboard:Int {
    case main, registration
}

class UIConstants: NSObject {
    
    static func getStoryboardIndentifier(_ id:Storyboard) -> String{
        switch id {
        case .main:
            return "Main"
        case .registration:
            return "Registration"
        }
    }
}

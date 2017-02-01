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
    
    static let userImage = "user_male"
    static let goal_dummy_image = "goalImage"

    
    
    struct NibNames {
        
        static var kCategoriesCellNib = "CategoryCollectionViewCell"
        static var kHomeCellNib = "HomeCollectionViewCell"
    }

    struct CellIdentifiers {
    
        static var kCategoryCellIdentifier = "categoryCollectionViewCell"
        static var kHomeCellIdentifier = "homeCollectionViewCell"
        
    }
    
    struct NavTitles {
    
        static var kHomeNavTitle = "Goals around the globe"
        static var kCategoriesNavTitle = "Select categories"
    
    }
    
}


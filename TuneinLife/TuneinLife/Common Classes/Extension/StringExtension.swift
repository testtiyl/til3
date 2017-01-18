//
//  StringExtension.swift
//  til2
//
//  Created by Hitesh Kumar on 27/05/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

import Foundation

extension String{
    static func isValid(_ str:String?) -> Bool {
        if let _ = str{
            return true
        }
        else{
            return false
        }
    }
    
    func toBool() -> Bool {
        switch self {
        case "True", "true", "yes", "1":
            return true
        case "False", "false", "no", "0":
            return false
        default:
            return false
        }
    }
    
    func capitalizingFirstLetter() -> String {
        let first = String(characters.prefix(1)).capitalized
        let other = String(characters.dropFirst())
        return first + other
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func toBase64()->String{
        
        let data:Data = self.data(using: String.Encoding.utf8)!
        
        return data.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        
    }
    
    // To check if string is not null, not empty
    
    func isValid() -> Bool{
        if self.isEmpty {
            return false
        }
        
        return true
    }
}

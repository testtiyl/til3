//
//  DictionaryExtension.swift
//  Crownit
//
//  Created by hitesh on 29/12/16.
//  Copyright © 2016 GoldVip Technology Solutions Pvt. Ldt. All rights reserved.
//

import Foundation

extension Dictionary{
    mutating func setCustomObjectForKey(_ dictionaryKey:Key?,obj:Value?){
        if let _ = obj{
            self[dictionaryKey!] = obj
        }
    }
}

extension Dictionary {
    init(elements:[(Key, Value)]) {
        self.init()
        for (key, value) in elements {
            updateValue(value, forKey: key)
        }
    }
}

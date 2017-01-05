//
//  DictionaryExtension.swift
//  til2
//
//  Created by Hitesh Kumar on 27/05/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
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

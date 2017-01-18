//
//  NSNumberExtension.swift
//  til2
//
//  Created by Hitesh Kumar on 27/05/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

import Foundation

extension NSNumber {
    var isBool: Bool { return CFBooleanGetTypeID() == CFGetTypeID(self) }
}

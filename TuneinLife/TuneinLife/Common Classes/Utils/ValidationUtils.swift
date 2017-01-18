//
//  ValidationUtils.swift
//  til2
//
//  Created by Hitesh Kumar on 27/05/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

import UIKit

class ValidationUtils: NSObject {

    class func isStringValid(_ paramString: String?) -> Bool {
        return nil != paramString && !(paramString is NSNull) && !paramString!.isEqual(NSNull()) && 0 < paramString!.characters.count
    }
    class func isObjectValid(_ paramObject: Any?) -> Bool {
        return nil != paramObject && !(paramObject is NSNull)
    }
}

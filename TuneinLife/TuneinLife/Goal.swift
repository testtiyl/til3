//
//  Goal.swift
//  til2
//
//  Created by Kanchan on 28/12/16.
//  Copyright © 2016 Shyatoria. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Goal {

    var imageURl : String
    var user_imgURL  :String
    var title : String
    var author: String
    var todo: Int
    var done: Int
}

extension Goal {

    init(json : JSON) {
        
        imageURl = json[""].stringValue
        user_imgURL = json[""].stringValue
        title = json[""].stringValue
        author = json[""].stringValue
        todo = json[""].intValue
        done = json[""].intValue
    }
}

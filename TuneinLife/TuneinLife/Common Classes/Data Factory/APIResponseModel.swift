//
//  APIResponseModel.swift
//  til2
//
//  Created by Hitesh Kumar on 27/05/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

import UIKit


class APIResponseModel: BaseDataModel {
    var customModel:AnyObject!
    var responseDictionary:[String : AnyObject] = [String : AnyObject]()
    var responseCode:Int!
    var rawResponse:String = ""
    var isSuccess:Bool = false
    var msg:String?
}

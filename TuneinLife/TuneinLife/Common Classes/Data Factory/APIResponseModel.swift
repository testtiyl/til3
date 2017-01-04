//
//  APIResponseModel.swift
//  CrownIt
//
//  Created by Nikhil Bansal on 10/06/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
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

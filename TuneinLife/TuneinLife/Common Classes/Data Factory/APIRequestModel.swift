//
//  APIRequestModel.swift
//  CrownIt
//
//  Created by Nikhil Bansal on 10/06/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
//

import UIKit

@objc public enum HttpMethodType:Int{
    case get, post, put, delete, patch, postData
}


enum encodingType:String{
    case URL = "URL"
    case JSON = "JSON"
    case URLEncodedInURL = "URLEncodedInURL"
}


class APIRequestModel: NSObject {
    var baseUrl:String = APIConstants.baseServerURL
//Prince
    var olaBaseUrl = ""//OlaApiConstants.baseServerURL
    var apiUrl:String!
    var parametersDict:[String:Any]?
    var httpMethodType:HttpMethodType = .get
    var encodeType:encodingType = .URL
    var isAuthHeaderRequired = false
    var isContentTypeRequired = false
    var isOtherAPI = false
    
    convenience init(apiUrl:String, parameters:[String:Any]?, httpMethodType:HttpMethodType,encoding:encodingType,isAuthHeaderRequired:Bool) {
        self.init()
        self.apiUrl = apiUrl
        self.parametersDict = parameters
        self.httpMethodType = httpMethodType
        self.encodeType = encoding
        self.isAuthHeaderRequired = isAuthHeaderRequired
    }
    
    convenience init(baseUrl: String,apiUrl:String, parameters:[String:Any]?, httpMethodType:HttpMethodType,encoding:encodingType,isAuthHeaderRequired:Bool) {
        self.init()
        self.baseUrl=baseUrl
        self.apiUrl = apiUrl
        self.parametersDict = parameters
        self.httpMethodType = httpMethodType
        self.encodeType = encoding
        self.isAuthHeaderRequired = isAuthHeaderRequired
    }
    
    convenience init(apiUrl:String, parameters:[String:Any]?, httpMethodType:HttpMethodType,encoding:encodingType,isAuthHeaderRequired:Bool,isContentTypeRequired:Bool) {
        self.init()
        self.apiUrl = apiUrl
        self.parametersDict = parameters
        self.httpMethodType = httpMethodType
        self.encodeType = encoding
        self.isAuthHeaderRequired = isAuthHeaderRequired
        self.isContentTypeRequired = isContentTypeRequired
    }

    
    
}

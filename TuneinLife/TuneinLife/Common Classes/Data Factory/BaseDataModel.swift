//
//  BaseDataModel.swift
//  til2
//
//  Created by Hitesh Kumar on 27/05/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

import UIKit

//import ObjectMapper

class BaseDataModel: NSObject {
/*
class BaseDataModel: NSObject, Mappable {

    
    let stringBoolTransform = TransformOf<Bool, String>(fromJSON: { (value: String?) -> Bool? in

        if value == nil{
            return false
        }
        
        return value!.toBool()
        
        }, toJSON: { (value: Bool?) -> String? in
            // transform value from Int? to String?
            if let value = value {
                return String(value)
            }
            return nil
    })
    
    let stringIntTransform = TransformOf<Int, String>(fromJSON: { (value: String?) -> Int in
        
        if value == nil || value == "" {
            return 0
        }
        
        return Int(value!)!
        
        }, toJSON: { (value: Int?) -> String? in
            // transform value from Int? to String?
            if let value = value {
                return String(value)
            }
            return nil
    })
    
    let anyIntTransform = TransformOf<Int, Any>(fromJSON: { (value: Any?) -> Int in
        
        if value == nil {
            return 0
        }
        
        if let str = value as? String {
            if str == "" {
                return 0
            }
            return Int(str)!
        }
        
        if let int = value as? Int {
            return int
        }
        
        return 0
        
        }, toJSON: { (value: Int?) -> String? in
            // transform value from Int? to String?
            if let value = value {
                return String(value)
            }
            return nil
    })
    
    
    let intBoolTransform = TransformOf<Bool, Int>(fromJSON: { (value: Int?) -> Bool? in
        
        if value == 0{
            return false
        }
        
        return true
        
        }, toJSON: { (value: Bool?) -> Int in
            // transform value from Int? to String?
            if value == nil || !value! {
                return 0
            }
            return 1
    })
    
    
    override init(){
        
    }
    
    //MARK: ObjectMapper
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
    }
    
    func parseData(json:String) -> BaseDataModel?{
        return self
    }
 */
}

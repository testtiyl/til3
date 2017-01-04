//
//  CacheUtil.swift
//  CrownIt
//
//  Created by Nikhil Bansal on 05/10/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
//

import UIKit

import RealmSwift

enum CacheErrorCode:Int {
    case Unavailable = 100, InvalidData = 200
}

class CacheUtil: NSObject {
    
    static func saveData(_ config:APIConfiguration, data:String, identifier:String){
        let cacheModel = CacheDataModel()
        
        cacheModel.identifier = identifier
        cacheModel.cacheInterval = config.cacheInterval
        cacheModel.category = config.category
        cacheModel.data = data
        cacheModel.save()
    }
    
    static func getData(_ identifier:String) -> CacheDataModel? {
        var cacheModel:CacheDataModel?
        
        let realm = try! Realm()
        
        let predicate = NSPredicate(format: "identifier = %@",identifier as NSObject)
        
        let caches = realm.objects(CacheDataModel.self).filter(predicate)
        
        for obj in Array(caches){
            cacheModel = obj.copy() as? CacheDataModel
        }
        
        return cacheModel
    }
}

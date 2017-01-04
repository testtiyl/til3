//
//  CacheDataModel.swift
//  CrownIt
//
//  Created by Nikhil Bansal on 07/10/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
//

import UIKit

import RealmSwift

class CacheDataModel: Object, NSCopying {
    dynamic var identifier:String = ""  // hash
    dynamic var data:String?  // JSON
    dynamic var category:String = ""
    dynamic var cacheInterval = 0
    dynamic var isValid: Bool = true
    dynamic var cacheTime:Date = Date()
 
    
    public func copy(with zone: NSZone? = nil) -> Any {
        let model = CacheDataModel()
        model.identifier = self.identifier
        model.data = self.data
        model.category = self.category
        model.cacheInterval = self.cacheInterval
        model.isValid = self.isValid
        model.cacheTime = self.cacheTime
        
        return model
    }
    
    //MARK: Public Methods
    
    func save(){
        
        let realm = try! Realm()
        
        let predicate = NSPredicate(format: "identifier = %@",identifier as NSObject)
        
        let caches = realm.objects(CacheDataModel.self).filter(predicate)
        
        for obj in Array(caches){
            try! realm.write {
                realm.delete(obj)
            }
        }
        
        // Add location
        try! realm.write{
            realm.add(self)
            
        }
    }
}

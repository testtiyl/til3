//
//  Categories.swift
//  TuneinLife
//
//  Created by Kanchan on 24/01/17.
//  Copyright © 2017 Shyatoria. All rights reserved.
//

import UIKit

struct Category{

    var catName : String
    var catGoalCount : Int
    var catImage : String
    var catCreatedDate : Date
    var isSelected : Bool
    
    init(catName: String, catGoalCount: Int, catImage:  String, catCreatedDate: Date, isSelected : Bool){
    
        self.catName = catName
        self.catGoalCount = catGoalCount
        self.catImage = catImage
        self.catCreatedDate = catCreatedDate
        self.isSelected = isSelected
    }
    
    init(){
    
        self.catName = ""
        self.catGoalCount = 0
        self.catImage = ""
        self.catCreatedDate = Date()
        self.isSelected = false
    }

}

class Categories: NSObject {

    private var categories  = [Category]()

    func getCategories() -> [Category]{
    
        let plistData : [[String: AnyObject]] = self.readPropertyList()
        var category = Category()
        
        for cat  in plistData {
            
            category.catName = cat[APIConstants.CategoryAPIConstants.catName] as! String
            category.catImage = cat[APIConstants.CategoryAPIConstants.catImage] as! String
            category.catCreatedDate = cat[APIConstants.CategoryAPIConstants.catDate] as! Date
            category.catGoalCount = cat[APIConstants.CategoryAPIConstants.catCount] as! Int
            category.isSelected = false
            
           categories.append(category)
        }
        
        return categories
    }
    
    private func readPropertyList() -> Array<[String : AnyObject]>{
        var propertyListForamt =  PropertyListSerialization.PropertyListFormat.xml //Format of the Property List.
        var plistData: [[String:AnyObject]] = [] //Our data
        let plistPath: String? = Bundle.main.path(forResource: "CategoriesData", ofType: "plist")! //the path of the data
        let plistXML = FileManager.default.contents(atPath: plistPath!)!
        do {//convert the data to a dictionary and handle errors.
            plistData = try PropertyListSerialization.propertyList(from: plistXML, options: .mutableContainersAndLeaves, format: &propertyListForamt) as! Array<[String : AnyObject]>
            
        } catch {
            print("Error reading plist: \(error), format: \(propertyListForamt)")
        }
        
        return plistData
    }
}

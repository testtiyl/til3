//
//  Goal.swift
//  til2
//
//  Created by Kanchan on 28/12/16.
//  Copyright © 2016 Shyatoria. All rights reserved.
//

import UIKit
import SwiftyJSON

class Goal {

    var imageURL : UIImage
    var user_imgURL  :UIImage
    var title : String
    var author: String
    var todo: Int
    var done: Int
    
    
    
    init (imageName : UIImage, user_img : UIImage, title : String,author: String, todo : Int, done : Int){
        
        self.imageURL = imageName
        self.user_imgURL = user_img
        self.title = title
        self.author = author
        self.todo = todo
        self.done = done
    }
    
    
}


//get image .. create goal object .. insert in goals array .. a var to get array of goals..  update table view when var is updated. 


extension Goal {
    
//    init(json : JSON) {
//        
//        imageURL = json[""]
//        user_imgURL = json[""]
//        title = json[""].stringValue
//        author = json[""].stringValue
//        todo = json[""].intValue
//        done = json[""].intValue
//    }

    
    func reloadTableView(){
    
        
    }
    
    static func staticGoals() -> [Goal]{
        var allGoals = [Goal]()
//        var goal = Goal(imageName: #imageLiteral(resourceName: "pencil"), user_img: #imageLiteral(resourceName: "user_male"), title: "Learn sketching ", author: "kanchan", todo:23 , done: 100)
//        allGoals.append(goal)
//        
       var goal  = Goal(imageName: #imageLiteral(resourceName: "coffee"), user_img: #imageLiteral(resourceName: "pooh2"), title: "Learn to make coffeee this year.. in winters..", author: "joker", todo:4555 , done: 1000)
        
        allGoals.append(goal)
        
        goal  = Goal(imageName: #imageLiteral(resourceName: "cake"), user_img: #imageLiteral(resourceName: "user_male"), title: "Less sugar ... ", author: "pooh", todo:4555 , done: 1000)
        
        allGoals.append(goal)
        
        goal  = Goal(imageName: #imageLiteral(resourceName: "frog"), user_img: #imageLiteral(resourceName: "user_male"), title: "Jumping japak jumping japak ", author: "batman broh.. :D", todo:4555 , done: 100000)
        
        allGoals.append(goal)
        
        return allGoals
    }
    
    func parseAPIResponse(){
        
        //init a goal here.
        
    }
}



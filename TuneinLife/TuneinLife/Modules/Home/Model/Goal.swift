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
    
    var goalImage : UIImage
    var user_imgURL  :UIImage
    var title : String
    var author: String
    var todo: Int
    var done: Int
    
    init (imageName : UIImage, user_img : UIImage, title : String,author: String, todo : Int, done : Int){
        
        self.goalImage = imageName
        self.user_imgURL = user_img
        self.title = title
        self.author = author
        self.todo = todo
        self.done = done
    }
}

class Goals {
    
    var allGoals : [Goal] = []
    
    init(){
    
        self.staticGoals()
    }
    
    func goalForItemAtIndexPath(indexPath: IndexPath) -> Goal?{
    
        if indexPath.row < allGoals.count{
        
            return allGoals[indexPath.row]
        }
        
        return nil
    }
    
    func getSectionCount() -> Int{
    
        return allGoals.count
    }
    func reloadTableView(){
    
        
    }
    
    func staticGoals(){
        
//        var goal = Goal(imageName: #imageLiteral(resourceName: "pencil"), user_img: #imageLiteral(resourceName: "user_male"), title: "Learn sketching ", author: "kanchan", todo:23 , done: 100)
//        allGoals.append(goal)
//        
       var goal  = Goal(imageName: #imageLiteral(resourceName: "coffee"), user_img: #imageLiteral(resourceName: "pooh2"), title: "Learn to make coffeee this year.. in winters..", author: "joker", todo:4555 , done: 1000)
        
        allGoals.append(goal)
        
        goal  = Goal(imageName: #imageLiteral(resourceName: "cake"), user_img: #imageLiteral(resourceName: "user_male"), title: "Less sugar ... ", author: "pooh", todo:4555 , done: 1000)
        
        allGoals.append(goal)
        
        goal  = Goal(imageName: #imageLiteral(resourceName: "frog"), user_img: #imageLiteral(resourceName: "user_male"), title: "Jumping japak jumping japak ", author: "batman broh.. :D", todo:4555 , done: 100000)
        
        allGoals.append(goal)
        goal  = Goal(imageName: #imageLiteral(resourceName: "goalImage"), user_img: #imageLiteral(resourceName: "user_male"), title: "Jumping japak jumping japak ", author: "batman broh.. :D", todo:4555 , done: 100000)
        
        allGoals.append(goal)
        goal  = Goal(imageName: #imageLiteral(resourceName: "pencil"), user_img: #imageLiteral(resourceName: "user_male"), title: "Jumping japak jumping japak ", author: "batman broh.. :D", todo:4555 , done: 100000)
        
        allGoals.append(goal)
        goal  = Goal(imageName: #imageLiteral(resourceName: "pooh2"), user_img: #imageLiteral(resourceName: "user_male"), title: "Jumping japak jumping japak ", author: "batman broh.. :D", todo:4555 , done: 100000)
        
        allGoals.append(goal)
        goal  = Goal(imageName: #imageLiteral(resourceName: "frog"), user_img: #imageLiteral(resourceName: "user_male"), title: "Jumping japak jumping japak ", author: "batman broh.. :D", todo:4555 , done: 100000)
        
        allGoals.append(goal)
        goal  = Goal(imageName: #imageLiteral(resourceName: "cake"), user_img: #imageLiteral(resourceName: "user_male"), title: "Jumping japak jumping japak ", author: "batman broh.. :D", todo:4555 , done: 100000)
        
        allGoals.append(goal)
        goal  = Goal(imageName: #imageLiteral(resourceName: "frog"), user_img: #imageLiteral(resourceName: "user_male"), title: "Jumping japak jumping japak ", author: "batman broh.. :D", todo:4555 , done: 100000)
        
        allGoals.append(goal)
        goal  = Goal(imageName: #imageLiteral(resourceName: "coffee-1"), user_img: #imageLiteral(resourceName: "user_male"), title: "Jumping japak jumping japak ", author: "batman broh.. :D", todo:4555 , done: 100000)
        
        allGoals.append(goal)
        goal  = Goal(imageName: #imageLiteral(resourceName: "frog"), user_img: #imageLiteral(resourceName: "user_male"), title: "Jumping japak jumping japak ", author: "batman broh.. :D", todo:4555 , done: 100000)
        
        allGoals.append(goal)
        goal  = Goal(imageName: #imageLiteral(resourceName: "frog"), user_img: #imageLiteral(resourceName: "user_male"), title: "Jumping japak jumping japak ", author: "batman broh.. :D", todo:4555 , done: 100000)
        
        allGoals.append(goal)
        goal  = Goal(imageName: #imageLiteral(resourceName: "goalImage"), user_img: #imageLiteral(resourceName: "user_male"), title: "Jumping japak jumping japak ", author: "batman broh.. :D", todo:4555 , done: 100000)
        
        allGoals.append(goal)
        goal  = Goal(imageName: #imageLiteral(resourceName: "frog"), user_img: #imageLiteral(resourceName: "user_male"), title: "Jumping japak jumping japak ", author: "batman broh.. :D", todo:4555 , done: 100000)
        
        allGoals.append(goal)
        goal  = Goal(imageName: #imageLiteral(resourceName: "pooh2"), user_img: #imageLiteral(resourceName: "user_male"), title: "Jumping japak jumping japak ", author: "batman broh.. :D", todo:4555 , done: 100000)
        
        allGoals.append(goal)
        
        
//        return allGoals
    }
    
    func parseAPIResponse(){
        
        //init a goal here.
        
    }
}



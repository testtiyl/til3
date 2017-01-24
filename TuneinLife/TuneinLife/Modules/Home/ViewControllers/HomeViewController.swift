//
//  HomeViewController.swift
//  til2
//
//  Created by Kanchan on 26/12/16.
//  Copyright © 2016 Shyatoria. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    let goals:[Goal] = []
    let kCellIdentifier = "homeTableViewCell"
    let kCollectionViewCellIdentifier = "homeCollectionViewCell"
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        self.fetchGoals()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Home Screen"
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: kCollectionViewCellIdentifier)
        
        if let layout = collectionView?.collectionViewLayout as? GridCVLayout {
            
            layout.delegate = self
        }
        
//        tableView.register(nib, forCellReuseIdentifier: kCellIdentifier)
//        tableView.rowHeight = UITableViewAutomaticDimension
//        tableView.estimatedRowHeight = 50
        
//        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: kCellIdentifier)
        
    }
    
    func fetchGoals(){
    
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

extension HomeViewController : GridLayoutDelegate {
    // 1
    @objc(collectionViewWithCollectionView:heightForGoalImageAtIndexPath:withWidth:) func collectionView(collectionView:UICollectionView, heightForGoalImageAtIndexPath indexPath:IndexPath,
                        withWidth width:CGFloat) -> CGFloat {
        
        if let goal = Goals().goalForItemAtIndexPath(indexPath: indexPath) {
            
            let photo = goal.goalImage
            return (photo.size.height * width)/photo.size.width
        }
            return 0.0
    }
    
    // 2
    @objc(collectionViewWithCollectionView:heightForGoalDetailsAtIndexPath:withWidth:) func collectionView(collectionView: UICollectionView,
                                                                                                           heightForGoalDetailsAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        
        
        
        
        
        if let goal = Goals().goalForItemAtIndexPath(indexPath: indexPath) {
            
            let photo = goal.goalImage
            
            let annotationPadding = CGFloat(4)
            let annotationHeaderHeight = CGFloat(17)
            let font = UIFont(name: "AvenirNext-Regular", size: 13)!
            let commentHeight = CGFloat(50) //photo.heightForComment(font, width: width)
            let height = annotationPadding + annotationHeaderHeight + commentHeight + annotationPadding
            return height
        }
        return 0.0
        
    }
}


extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        let goals:[Goal] = Goal.staticGoals()
//        return goals.count
//        
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let goalCell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath) as? HomeTableViewCell
//        let goal = Goal.staticGoals()[indexPath.row] as Goal
//        
//       goalCell?.goalImageView.image = goal.imageURL
//       goalCell?.userImage.imageView?.image = goal.user_imgURL
//       goalCell?.todoBtn.titleLabel?.text = String(goal.todo)
//       goalCell?.doneBtn.titleLabel?.text = String( goal.done)
//       goalCell?.titleLbl.text = goal.title
//        
//       return goalCell!
//    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
//    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        return 50
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var size = CGSize()
        guard let goal: Goal = Goals().goalForItemAtIndexPath(indexPath: indexPath)  else {
            //show some error message.
            return CGSize()
        }
        size.width = UIScreen.main.bounds.width/2 - 10  // 10 for spacing
        size.height = goal.goalImage.size.height*size.width/goal.goalImage.size.width - 10
        return size
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           
        return Goals().getSectionCount()
    }
    
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let goal = Goals().goalForItemAtIndexPath(indexPath: indexPath) {
            
            let goalCell = collectionView.dequeueReusableCell(withReuseIdentifier: kCollectionViewCellIdentifier, for: indexPath) as! HomeCollectionViewCell
            goalCell.imageView.image = goal.goalImage
            goalCell.userImageView.image = goal.user_imgURL
            goalCell.goalTitle.text = goal.title
            goalCell.userName.text = goal.author
            
            goalCell.layer.borderWidth = 1
            goalCell.layer.borderColor = UIColor.black.cgColor
            
            return goalCell
        }
        //TODO : what to do here if goal is nil or cell is nil
        return UICollectionViewCell()
    }
}

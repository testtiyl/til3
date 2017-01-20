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

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {

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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let goals: [Goal] = Goal.staticGoals()
        return goals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let goal = Goal.staticGoals()[indexPath.row] as Goal
        let goalCell = collectionView.dequeueReusableCell(withReuseIdentifier: kCollectionViewCellIdentifier, for: indexPath) as! HomeCollectionViewCell
        goalCell.imageView.image = goal.imageURL
        goalCell.userImageView.image = goal.user_imgURL
        goalCell.goalTitle.text = goal.title
        goalCell.userName.text = goal.author
        
        return goalCell
    }
}

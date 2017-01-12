//
//  HomeViewController.swift
//  til2
//
//  Created by Kanchan on 26/12/16.
//  Copyright © 2016 Shyatoria. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let goals:[Goal] = []
    let kCellIdentifier = "homeTableViewCell"

    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        self.fetchGoals()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Home Screen"
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: kCellIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.estimatedRowHeight = 50
        
//        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: kCellIdentifier)

    }
    
    func fetchGoals(){
    
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let goalCell = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier, for: indexPath) as? HomeTableViewCell
       goalCell?.goalImageView.image = #imageLiteral(resourceName: "goalImage")
       goalCell?.userImage.imageView?.image = #imageLiteral(resourceName: "user_male")
       goalCell?.todoBtn.titleLabel?.text = "todo: count"
       goalCell?.doneBtn.titleLabel?.text = "done: count"
        goalCell?.titleLbl.text = "learn skating in shimla this winter. visit north east india."
        return goalCell!
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableViewAutomaticDimension
//    }
//    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        return 50
//    }
}

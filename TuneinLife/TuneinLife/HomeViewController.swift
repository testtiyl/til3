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
    let cellIdentifier = "cartTableViewCell"

    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        self.fetchGoals()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    func fetchGoals(){
    
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

extension HomeViewController : UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.goals.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 41 + 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:HomeTableViewCell  = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeTableViewCell
        cell.goalTitleLbl.text = "goal test text"
        return cell
        
    }
   
}


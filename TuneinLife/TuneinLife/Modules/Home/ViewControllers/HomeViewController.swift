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
    }
    
    func fetchGoals(){
    
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}


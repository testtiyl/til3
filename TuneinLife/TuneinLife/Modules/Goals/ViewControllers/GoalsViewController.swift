//
//  GoalsViewController.swift
//  til2
//
//  Created by Kanchan on 26/12/16.
//  Copyright © 2016 Shyatoria. All rights reserved.
//

import UIKit

class GoalsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func goToFbLoginScreenClicked(_ sender: UIButton) {
        
        let loginVC :FbLoginViewController = FbLoginViewController(nibName:"FbLoginViewController" , bundle: nil)
        
            //UIViewController(nibName:"FbLoginViewController" , bundle: nil) as! FbLoginViewController
        
        loginVC.vcTitle = "new title"
        
        self.present(loginVC, animated: true, completion: nil)
        
    }

}

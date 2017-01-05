//
//  CategoriesViewController.swift
//  til2
//
//  Created by Kanchan on 26/12/16.
//  Copyright © 2016 Shyatoria. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

    
    @IBOutlet weak var selectedCategory: UILabel!
    @IBOutlet var categoryBtn: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for  btn in categoryBtn {
            
            btn.titleLabel?.adjustsFontSizeToFitWidth = true
            
        }

    }

    @IBAction func categoryBtnTapped(_ sender: UIButton) {
        
        let currentBtnCat = sender.currentTitle
        let displayText = selectedCategory.text
        selectedCategory.text = displayText! + "\n" + currentBtnCat!
        
    }
    
}

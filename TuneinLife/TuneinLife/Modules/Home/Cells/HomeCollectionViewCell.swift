//
//  HomeCollectionViewCell.swift
//  TuneinLife
//
//  Created by Kanchan on 19/01/17.
//  Copyright © 2017 Shyatoria. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var userImageView: UIImageView!

    @IBOutlet weak var goalTitle: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.goalTitle.text = ""
        self.userImageView.image = nil
        self.userName.text = ""
        self.imageView.image = nil
        
        // Initialization code
    }

}

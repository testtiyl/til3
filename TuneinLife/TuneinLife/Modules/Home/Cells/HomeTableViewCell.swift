//
//  HomeTableViewCell.swift
//  til2
//
//  Created by Kanchan on 28/12/16.
//  Copyright © 2016 Shyatoria. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var goalImageView: UIImageView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var goalTitleLbl: UILabel!
    @IBOutlet weak var doneLbl: UILabel!
    @IBOutlet weak var todoLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

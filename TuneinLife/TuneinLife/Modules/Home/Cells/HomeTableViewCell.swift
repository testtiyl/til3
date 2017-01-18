//
//  HomeTableViewCell.swift
//  TuneinLife
//
//  Created by Kanchan on 12/01/17.
//  Copyright © 2017 Shyatoria. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var goalImageView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!

    @IBOutlet weak var todoBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var userImage: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLbl.text = ""
        todoBtn.titleLabel?.text = "TODO: "
        doneBtn.titleLabel?.text = "Done: "
        userImage.imageView?.image = UIImage(named: UIConstants.userImage)
        goalImageView.image = #imageLiteral(resourceName: "goalImage")
        
        let aspectRatio = (UIImage(named: UIConstants.userImage)?.size.height)!/(UIImage(named: UIConstants.userImage)?.size.width)!
        
        
       goalImageView.frame =  CGRect(x: goalImageView.frame.origin.x, y: goalImageView.frame.origin.y, width: goalImageView.frame.size.width, height: goalImageView.bounds.width * aspectRatio)
        
        
    }
 
//    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
}

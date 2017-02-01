//
//  CategoryCollectionViewCell.swift
//  TuneinLife
//
//  Created by Kanchan on 25/01/17.
//  Copyright © 2017 Shyatoria. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var catImageview: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override var bounds : CGRect {
        didSet {
            self.layoutIfNeeded()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        //self.makeItCircle()
    }
    
    func makeItCircle() {
        
      //  self.categoryLabel.layer.masksToBounds = true
      //  self.categoryLabel.layer.cornerRadius  = CGFloat(roundf(Float(self.categoryLabel.frame.size.width/2.0)))
    }
    
    func addShadowForRoundedButton(view: UIView, button: UIButton, shadowColor: UIColor, shadowOffset: CGSize, opacity: Float = 1) {
        
        let shadowView = UIView()
        shadowView.backgroundColor = shadowColor
        shadowView.layer.opacity = opacity
        shadowView.layer.cornerRadius = button.bounds.size.width / 2
        shadowView.frame = CGRect(origin: CGPoint(x: button.frame.origin.x + shadowOffset.width, y: button.frame.origin.y + shadowOffset.height), size: CGSize(width: button.bounds.width, height: button.bounds.height))
        self.addSubview(shadowView)
        view.bringSubview(toFront: button)
    }
}

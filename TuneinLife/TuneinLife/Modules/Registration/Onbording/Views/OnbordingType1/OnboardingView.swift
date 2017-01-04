//
//  OnboardingView.swift
//  CrownIt
//
//  Created by swarnima on 15/03/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
//

import UIKit

class OnboardingView: UIView {

    var imgRadius: CGFloat = (AppConstants.ScreenWidth - 50)/2           //100, state imageView x coordinate as 1/2 * 100
    
    var topLabel:UILabel!
    var bottomLabel:UILabel!
    var imageView:UIImageView!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        topLabel = UILabel()
        topLabel.frame = CGRect(x: bounds.origin.x, y: AppConstants.ScreenHeight / 20, width: AppConstants.ScreenWidth , height: 30 )           //70,  50
        topLabel.textAlignment = NSTextAlignment.center
        topLabel.textColor = UIColor.black
        topLabel.font = UIFont(name: "HelveticaNeue", size: CGFloat(18))
        topLabel.numberOfLines = 0
        
        imageView = UIImageView()
        imageView.frame = CGRect(x: bounds.origin.x + 25 , y: self.bottomOfView(topLabel) + AppConstants.ScreenHeight / 20 ,width: 2*imgRadius, height: 2*imgRadius)         //20
        
        bottomLabel = UILabel()
        bottomLabel.frame = CGRect(x: bounds.origin.x + 20, y: self.bottomOfView(imageView) + AppConstants.ScreenHeight / 20 - 15, width: AppConstants.ScreenWidth - 40, height: 50)
        bottomLabel.textAlignment = NSTextAlignment.center
        bottomLabel.textColor = UIColor.gray
        bottomLabel.font = UIFont(name: "HelveticaNeue", size: CGFloat(13))
        bottomLabel.numberOfLines = 0
        
        self.addSubview(imageView)
        self.addSubview(topLabel)
        self.addSubview(bottomLabel)
        
    }
    
    func bottomOfView(_ view:UIView) -> CGFloat {
        
        return view.frame.origin.y+view.frame.size.height;
    }

}

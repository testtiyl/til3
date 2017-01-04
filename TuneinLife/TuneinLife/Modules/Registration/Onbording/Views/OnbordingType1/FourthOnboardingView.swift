//
//  FourthOnboardingView.swift
//  CrownIt
//
//  Created by swarnima on 15/03/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
//

import UIKit

class FourthOnboardingView: OnboardingView {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.topLabel.text = "Earn crowns and rush tickets"
        self.bottomLabel.text = "Earn cashback in crowns & collect rush tickets \n for all check-ins"
        self.topLabel.sizeToFit()
        self.topLabel.center = CGPoint(x: AppConstants.ScreenWidth/2, y: self.topLabel.center.y)
        self.imageView.image = UIImage(named: "c4.png")
        
    }

}

//
//  FifthOnvoardingView.swift
//  CrownIt
//
//  Created by swarnima on 15/03/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
//

import UIKit

class FifthOnvoardingView: OnboardingView {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.topLabel.text = "Earn, Save, Shop - Repeat"
        self.bottomLabel.text = "Redeem your crowns at top online stores \n Collect rush tickets and win grand prizes every week"
        
        self.imageView.layer.cornerRadius = self.imgRadius
        self.imageView.image = UIImage(named: "c5.png")
        self.imageView.clipsToBounds = true
        
    }

}

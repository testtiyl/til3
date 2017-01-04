//
//  FirstOnboardingView.swift
//  CrownIt
//
//  Created by swarnima on 15/03/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
//

import UIKit

class FirstOnboardingView:OnboardingView {
    
//    var circleImageView : UIImageView!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.topLabel.text = "Visit an outlet of your choice"
        self.bottomLabel.text = "Choose from over 10,000 outlets in your city"
        
    }
    
}

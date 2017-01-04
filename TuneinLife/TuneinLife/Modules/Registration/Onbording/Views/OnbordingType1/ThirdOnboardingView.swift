//
//  ThirdOnboardingView.swift
//  CrownIt
//
//  Created by swarnima on 15/03/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
//

import UIKit

class ThirdOnboardingView: OnboardingView {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.topLabel.text = "Bill approvals at one go"
        self.bottomLabel.text = "We will approve your bills as soon as we receive them"
     
        self.imageView.image = UIImage(named: "c3.png")
        
    }

}

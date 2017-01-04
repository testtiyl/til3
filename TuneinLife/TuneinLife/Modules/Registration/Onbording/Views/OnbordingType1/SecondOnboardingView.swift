//
//  SecondOnboardingView.swift
//  CrownIt
//
//  Created by swarnima on 15/03/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
//

import UIKit

class SecondOnboardingView: OnboardingView {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.topLabel.text = "Upload your bill image"
        self.bottomLabel.text = "Send us an image of your bill for exclusive cashback"
    
        self.imageView.image = UIImage(named: "c2_with-bill")

    }

}

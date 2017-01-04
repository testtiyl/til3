//
//  SplashTipsView.swift
//  CrownIt
//
//  Created by swarnima on 06/05/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
//

import UIKit

class SplashTipsView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var tipsView: UIView!
    
    @IBOutlet weak var tipsLabel: UILabel!
    
    @IBOutlet weak var tipRoundView: UIView!
    
    func updateUIWith(_ tips:String) {
        
        self.addShadow()
        tipsView.backgroundColor = UIColor.white
        tipsLabel.numberOfLines = 0
        tipsLabel.text = tips
    }
    
    func addShadow() {
        
        let shadowView = UIView(frame:tipsView.frame)
        
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize.zero
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowRadius = 5
        
        tipsView.frame = shadowView.bounds
        tipsView.backgroundColor = UIColor.white
        tipsView.layer.cornerRadius = 10.0
        
        self.addSubview(shadowView)
        shadowView.addSubview(tipsView)

        
    }
    

}

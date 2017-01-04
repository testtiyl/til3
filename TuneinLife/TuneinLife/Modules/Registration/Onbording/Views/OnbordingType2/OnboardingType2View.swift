//
//  OnboardingType2View.swift
//  CrownIt
//
//  Created by swarnima on 27/12/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
//

import UIKit

protocol OnboardingType2ViewDelegate:NSObjectProtocol {
    func skipLoginTapped()
}

class OnboardingType2View: UIView {

    
    @IBOutlet var topFirstLabel: UILabel!
    @IBOutlet var topSecondLabel: UILabel!
    @IBOutlet var topThirdLabel: UILabel!
    
    
    @IBOutlet var imgHeight: NSLayoutConstraint!
    @IBOutlet var imgWidth: NSLayoutConstraint!

    @IBOutlet var fbView: UIView!

    
    weak var delegate:OnboardingType2ViewDelegate?
    weak var fbButtonDelegate:FBLoginButtonDelegate?
    
    func updateView() {

        let string:NSMutableAttributedString = NSMutableAttributedString(string: "Offers \u{2022} Cashbacks \u{2022} Discounts")
        string.addAttribute(NSForegroundColorAttributeName, value: UIColor(hex: 0xB6D999), range: NSRange(location:7,length:1))        
         string.addAttribute(NSForegroundColorAttributeName, value: UIColor(hex: 0xB6D999), range: NSRange(location:19,length:1))
        
        topSecondLabel.attributedText = string
        
        fbView.layer.cornerRadius = 4.0
       fbView.clipsToBounds = true
        
       // self.fbButtonDelegate = fbLoginButton.delegate
        
        imgWidth.constant = AppConstants.ScreenWidth - 90
        imgHeight.constant = AppConstants.ScreenWidth - 90
        
    }
    
    
    
    @IBAction func skipLogin(_ sender: AnyObject) {
        
        delegate?.skipLoginTapped()
    }
    

}

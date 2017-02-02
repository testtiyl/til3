//
//  CustomSquareView.swift
//  TuneinLife
//
//  Created by Kanchan on 01/02/17.
//  Copyright © 2017 Shyatoria. All rights reserved.
//

import UIKit

class CustomSquareView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    var shadowLayer: CAShapeLayer!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        if shadowLayer == nil {
//            shadowLayer = CAShapeLayer()
//            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: 12).cgPath
//            shadowLayer.fillColor = UIColor.white.cgColor
//            
//            shadowLayer.shadowColor = UIColor.darkGray.cgColor
//            shadowLayer.shadowPath = shadowLayer.path
//            shadowLayer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//            shadowLayer.shadowOpacity = 0.8
//            shadowLayer.shadowRadius = 2
//            layer.insertSublayer(shadowLayer, at: 0)
//            //layer.insertSublayer(shadowLayer, below: nil) // also works
//        }
//        self.layer.shadowColor = UIColor.darkGray.cgColor
//        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
//        self.layer.shadowOpacity = 0.8
//        self.layer.borderWidth = 0.5
//        self.layer.borderColor = UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
//        self.layer.cornerRadius = 12
//        self.layer.opacity = 1.0

//        let radius: CGFloat = self.frame.width / 2.0 //change it to .height if you need spread for height
//        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 2.1 * radius, height: self.frame.height))
//        //Change 2.1 to amount of spread you need and for height replace the code for height
//        
//        self.layer.cornerRadius = 2
//        self.layer.shadowColor = UIColor.black.cgColor
//        self.layer.shadowOffset = CGSize(width: 0.5, height: 0.4)  //Here you control x and y
//        self.layer.shadowOpacity = 0.5
//        self.layer.shadowRadius = 5.0 //Here your control your blur
        self.layer.masksToBounds =  false
//        self.layer.shadowPath = shadowPath.cgPath
//        
        self.layer.borderWidth  = 0.5
        self.layer.borderColor = UIColor(red: 170, green: 177, blue: 204, alpha: 0.6).cgColor
        self.layer.cornerRadius = 10
        
    }
    
}

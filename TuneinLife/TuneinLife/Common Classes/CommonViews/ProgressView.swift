//
//  ProgressView.swift
//  CrownitMerchantApp
//
//  Created by Nikhil Bansal on 27/05/16.
//  Copyright © 2016 Nikhil Bansal. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    var baseView:UIView!
    var activityIndicator:UIActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showProgressView(animated:Bool){
        self.baseView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        self.baseView.center = CGPoint.init(x: self.frame.size.width/2, y: self.frame.size.width/2)
        self.baseView.backgroundColor = UIColor(white: 0.8, alpha: 0.9)
        self.baseView.layer.cornerRadius = 10
        self.addSubview(self.baseView)
        
        
        self.activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        self.activityIndicator.center = CGPoint.init(x: self.baseView.frame.size.width/2, y: self.baseView.frame.size.height/2)
        self.activityIndicator.startAnimating()
        self.baseView.addSubview(self.activityIndicator)
        
    }
    
    func hideProgressView(animated:Bool){
        self.activityIndicator.stopAnimating()
        self.activityIndicator.removeFromSuperview()
        self.baseView.removeFromSuperview()
    }
}

//
//  NavigationPopDownView.swift
//  til2
//
//  Created by Hitesh Kumar on 27/05/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

import UIKit

class NavigationPopDownView: UIView {
    
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet var containerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    
    func xibSetup() {
        containerView = loadViewFromNib()
        
        containerView.frame = bounds
        
        containerView.autoresizingMask =  [.flexibleWidth, .flexibleHeight]
        
        dismissButton.tintColor = UIColor.white  
        
        addSubview(containerView)
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "NavigationPopDownView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    @IBAction func dismiss(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.3, animations: {
            var frame = self.frame
            frame.origin.y = frame.origin.y - frame.size.height
            self.frame = frame;
            }, completion: {
                finished in
                self.removeFromSuperview()
            })
    }
    
}

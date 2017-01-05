//
//  TILBaseViewController.swift
//  til2
//
//  Created by Hitesh Kumar on 27/05/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

import UIKit

class TILBaseViewController: UIViewController {

    let reachability = Reachability()!
    
    var downView:NavigationPopDownView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !NetworkUtility.isNetworkAvailable && self.navigationController != nil {
            showNavigationDropDownView(self.navigationController!, message: "Internet not available", height: 25)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(TILBaseViewController.showDropDownView(_:)), name: NSNotification.Name(rawValue: "NoInternetViewShow"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(TILBaseViewController.hideDropDownView(_:)), name: NSNotification.Name(rawValue: "NoInternetViewHide"), object: nil)
        
    }
    
    func showDropDownView(_ notification:Notification) {
        
        if (self.navigationController != nil) {
            showNavigationDropDownView(self.navigationController!, message: "Internet not available", height: 25)
        }
    }
    func hideDropDownView(_ notification:Notification) {
        if downView == nil {
            return
        }
        downView?.dismiss("" as AnyObject)
        downView = nil
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showNavigationDropDownView(_ navigationController: UINavigationController, message: String, height: CGFloat){
        
        if downView != nil{
            return
            
        }
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let navigationControllerHeight =  navigationController.navigationBar.frame.size.height
        
        let startingPosition = navigationControllerHeight + statusBarHeight - height
        
        //Navbar
        let navbar = NavigationPopDownView(frame: CGRect(x: 0, y: startingPosition, width: navigationController.navigationBar.frame.size.width, height: height))
        downView = navbar
        navbar.titleLabel.text = message
        
        navigationController.navigationBar.superview?.insertSubview(navbar, belowSubview: navigationController.navigationBar)
        
        //Animate down
        UIView.animate(withDuration: 0.3, animations: {
            var frame = navbar.frame
            frame.origin.y = navigationControllerHeight + statusBarHeight
            navbar.frame = frame;
        })
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "NoInternetViewShow"), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "NoInternetViewHide"), object: nil)
    }

}

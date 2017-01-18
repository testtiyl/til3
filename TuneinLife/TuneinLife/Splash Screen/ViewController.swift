//
//  ViewController.swift
//  til2
//
//  Created by Hitesh Kumar on 27/05/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tipview:SplashTipsView!

    override func viewDidLoad() {
        super.viewDidLoad()
        showTip()
//        Timer.scheduledTimer(timeInterval: 3.5, target: self, selector: #selector(self.launchFbLogin), userInfo: nil, repeats: false)
        launchFbLogin()
    }
    
    func launchFbLogin() {
        let storyboard = UIStoryboard(name: UIConstants.getStoryboardIndentifier(.registration), bundle: Bundle.main)
        let navigationController:UINavigationController = storyboard.instantiateViewController(withIdentifier: "navLogin") as! UINavigationController
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "onboardingViewControllerBoard")
        navigationController.viewControllers = [secondViewController]
        let appDel = UIApplication.shared.delegate as! AppDelegate
        appDel.window?.rootViewController = nil
        appDel.window?.rootViewController = navigationController
    }
    
    func showTip() {
    
        let tipString:String? = "I am a good boy"
        tipview = SplashTipsView()
        tipview = Bundle.main.loadNibNamed("SplashTips", owner: self, options:nil)![0] as! SplashTipsView
        tipview.backgroundColor = UIColor.clear
        tipview.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.view.addSubview(tipview)
        
        tipview.updateUIWith(tipString!)
    }
    

}


//
//  ViewController.swift
//  Crownit
//
//  Created by hitesh on 28/12/16.
//  Copyright © 2016 GoldVip Technology Solutions Pvt. Ldt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tipview:SplashTipsView!

    override func viewDidLoad() {
        super.viewDidLoad()
        showTip()
        Timer.scheduledTimer(timeInterval: 3.5, target: self, selector: #selector(self.launchFbLogin), userInfo: nil, repeats: false)
    }
    
    func launchFbLogin() {
        let storyboard = UIStoryboard(name: UIConstants.getStoryboardIndentifier(.registration), bundle: Bundle.main)
        let navigationController:UINavigationController = storyboard.instantiateViewController(withIdentifier: UIConstants.getViewControllerIdentifier(.loginNavigation)) as! UINavigationController
        let secondViewController = storyboard.instantiateViewController(withIdentifier: UIConstants.getViewControllerIdentifier(.onBording))
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


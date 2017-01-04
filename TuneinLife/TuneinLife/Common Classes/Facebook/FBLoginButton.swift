//
//  FBLoginButton.swift
//  CrownIt
//
//  Created by Nikhil Bansal on 16/11/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
//

import UIKit

protocol FBLoginButtonDelegate:NSObjectProtocol  {
    func loginButton(_ loginButton: FBLoginButton!, isCancelled:Bool, error: Error?)
}

class FBLoginButton: UIButton, FBWebViewControllerDelegate {
    
    var readPermissions:Array<String>?
    var publishPermissions:Array<String>?
    
    weak var delegate:FBLoginButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: 30))
        
        self.frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: 30)
        
        self.backgroundColor = UIColor(hex: 0x3b5998)
        self.setTitle("Log in with Facebook", for: .normal)
        
        self.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func tapped(sender:UIButton){
        
        //UIApplication.shared.openURL(<#T##url: URL##URL#>)
        
        let webviewVC = FBWebViewController(nibName: "FBWebViewController", bundle: nil)
        webviewVC.delegate = self
        webviewVC.readPermissions = readPermissions
        webviewVC.publishPermissions = publishPermissions
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController?.present(webviewVC, animated: true, completion: nil)
    }
    
    //MARK: FBWebviewControllerDelegate
    
    func webview(_ webview: FBWebViewController!, isCancelled: Bool, error: Error?) {
        
        delegate?.loginButton(self, isCancelled: isCancelled, error: error)
    }
}

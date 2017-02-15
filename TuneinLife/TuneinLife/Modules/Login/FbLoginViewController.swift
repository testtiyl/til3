//
//  FbLoginViewController.swift
//  TuneinLife
//
//  Created by Kanchan on 14/02/17.
//  Copyright © 2017 Shyatoria. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class FbLoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    var vcTitle : String = ""
    @IBOutlet weak var fbLoginBtn: FBSDKLoginButton!
       
//    @IBAction func fbLoginBtnClicked(_ sender: FBSDKLoginButton) {
//   
//    }
    
    @IBAction func closeBtnClicked(_ sender: UIButton) {
        
//        let loginVC :FbLoginViewController = FbLoginViewController(nibName:"FbLoginViewController" , bundle: nil)
//        loginVC.removeFromParentViewController()
       // self.removeFromParentViewController()
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fbLoginBtn.delegate = self
        
        if (FBSDKAccessToken.current() != nil) {
            
            // User is logged in, do work such as go to next view controller.
        }else {

            fbLoginBtn.readPermissions = ["public_profile", "email", "user_friends"]
        }
        
    }

    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!){
    
        if ((error) != nil) {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            if result.grantedPermissions.contains("email"){
                print("token: \(result.token.userID)")
                var userData : [String: AnyObject] = [:]

                userData["userId"] = result.token.userID as AnyObject?
                UserDefaults.standard.set(result.token.userID , forKey: "UserId")
                userData["tokenString"] = result.token.tokenString as AnyObject?
                
            }
        }
    }

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!){
    
        //logout handling.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

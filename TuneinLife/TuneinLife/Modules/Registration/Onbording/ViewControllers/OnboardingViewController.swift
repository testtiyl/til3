//
//  OnboardingViewController.swift
//  til2
//
//  Created by Hitesh Kumar on 15/03/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func <= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l <= r
  default:
    return !(rhs < lhs)
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}

class OnboardingViewController: TILBaseViewController, FBLoginButtonDelegate, UIScrollViewDelegate, OnboardingType2ViewDelegate {
    
    var fbLogInView: UIView!
    var skipButton:UIButton!
    var skipButtonTypeII:UIButton!
    @IBOutlet weak var onboardingScrollView: UIScrollView!
    
    let SCREEN_WIDTH = AppConstants.ScreenWidth
    let SCREEN_HEIGHT = AppConstants.ScreenHeight
    
    var isPhoneRegScreenLoaded:Bool!
        
    var onboardingType2View:OnboardingType2View!

    var xOffset :CGFloat!
    var yOffset :CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpOnboardingType2()
        
        updateDeviceInfo()
        
    }
    
    
    internal func updateDeviceInfo(){
//        DeviceManager.sharedInstance().updateUserDeviceData { (response) in
//    }
    }
    
    func setUpOnboardingType2() {
        
        if self.onboardingType2View == nil {
            
            self.onboardingType2View = Bundle.main.loadNibNamed("OnboardingTypeII", owner: self, options: nil)!.first as? OnboardingType2View
            self.onboardingType2View.frame = CGRect(x: 0, y: 0, width: AppConstants.ScreenWidth, height: AppConstants.ScreenHeight)
            self.onboardingType2View.delegate = self
            
            self.setupType2Fb()
            self.view.addSubview(self.onboardingType2View)
        }
        
        self.onboardingType2View.updateView()
    }
    
    func setupType2Fb() {
        
        if self.onboardingType2View.fbView != nil {
            
            var fbLoginBtn: FBLoginButton
            fbLoginBtn = FBLoginButton ()
            fbLoginBtn.frame = CGRect(x: 0,y: 0, width: AppConstants.ScreenWidth - 60, height: 35)
            fbLoginBtn.setImage(UIImage(named:"fb_Image"), for: .normal)
            fbLoginBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 0)
            
            self.onboardingType2View.fbView.addSubview(fbLoginBtn)
            
            fbLoginBtn.readPermissions = ["public_profile", "email", "user_friends"];
            fbLoginBtn.publishPermissions = ["publish_actions"];
            fbLoginBtn.delegate = self;
            
            isPhoneRegScreenLoaded = false;
            self.facebookUISetup()
        }
        
    }
    
     //MARK: skip button ////////////////////////
    
    func setUpSkipButtonUI() {
        self.skipButton = UIButton(frame:CGRect(x: SCREEN_WIDTH!-60-10,y: SCREEN_HEIGHT!-80,width: 60,height: 30))
        self.skipButton.setTitle("Not Now", for: UIControlState())
        self.skipButton.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        self.skipButton.setTitleColor(UIColor.black, for: UIControlState())
        self.skipButton.addTarget(self, action: #selector(self.skipButtonPressed(_:)), for: .touchUpInside)
        self.view.addSubview(self.skipButton)
        self.view.bringSubview(toFront: self.skipButton)
        self.skipButton.sizeToFit()
        self.skipButton.alpha = 0;
        self.skipButton.isUserInteractionEnabled = false
        
    }
    
    func setUpSkipButtonForTypeII() {
        self.skipButtonTypeII = UIButton(frame:CGRect(x: SCREEN_WIDTH!/2 - 40, y: SCREEN_HEIGHT!-40,width: 80,height: 40))
        self.skipButtonTypeII.setTitle("Not Now", for: UIControlState())
        self.skipButtonTypeII.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
        self.skipButtonTypeII.addTarget(self, action: #selector(skipLogin), for: .touchUpInside)
        self.view.addSubview(self.skipButtonTypeII)
        self.view.bringSubview(toFront: self.skipButtonTypeII)
        self.skipButtonTypeII.sizeToFit()
        
        self.skipButtonTypeII.setTitleColor(UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1), for: UIControlState())
        self.skipButtonTypeII.alpha = 1;
        self.skipButtonTypeII.isUserInteractionEnabled = true
    }

    func skipLogin(){
        self.skipButtonPressed(self)
    }
    
    func skipButtonPressed(_ sender:AnyObject?){
        print("skip")
        
        let storyboard = UIStoryboard(name: UIConstants.getStoryboardIndentifier(.main), bundle: Bundle.main)
        let vc:HomeViewController = storyboard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
//        weak var weakSelf = self
//        UIHelper.showLoaderView(self.view, animated: true)
//        
//        UserManager.sharedInstance().skipRegistration { (responseObject) -> Void in
//            
//            DispatchQueue.main.async {
//                UIHelper.hideLoaderView((weakSelf?.view)!, animated: true)
//                
//                if(responseObject?.errorObject.isSuccessAtServer)!{
//                    
//                    try! weakSelf?.checkIfGuestUser()
//                }else{
//                    if !NetworkUtility.isNetworkAvailable {
//                        CommonFunctions.makeAlertBox("Please check your internet conneciton.", title: "Alert", button1: "OK", button2: nil, tag: 100, delegate: nil)
//                    } else  {
//                        CommonFunctions.makeAlertBox(responseObject?.errorObject.errorMessageFromServer, title: "Alert", button1: "OK", button2: nil, tag: 100, delegate: nil)
//                    }
//                }
//            }
//        
//        }
        
        return
    }
    
//    func checkIfGuestUser() throws{
//        if (UserManager.sharedInstance().user != nil && UserManager.sharedInstance().user.userType == .default && CommonFunctions.checkValue(forNullOrBlank: UserManager.sharedInstance().user.sessionId)){
//            self.dismisThisNav()
//            return
//        }
//    }
    
//    func dismisThisNav(){
//        //self.navigationController?.dismiss(animated: true, completion: nil)
//        let appDel = UIApplication.shared.delegate as! AppDelegate
//        appDel.launchMainApp()
//    }
    
    // MARK: FB Login
    func setUpFbLogIn() {
        
//        fbLogInView = UIView ()
//        fbLogInView.frame = CGRectMake(0, SCREEN_HEIGHT - 50, SCREEN_WIDTH, 50)
        fbLogInView.backgroundColor =  UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1)
        self.view.addSubview(fbLogInView)
        self.view.bringSubview(toFront: fbLogInView)
        
        var fbLoginBtn: FBLoginButton
        fbLoginBtn = FBLoginButton ()
        fbLoginBtn.frame = CGRect(x: 0,y: 0, width: fbLogInView.frame.size.width, height: fbLogInView.frame.size.height)
        fbLoginBtn.readPermissions = ["public_profile", "email", "user_friends"];
        fbLoginBtn.publishPermissions = ["publish_actions"];
        fbLoginBtn.delegate = self;
        self.fbLogInView.addSubview(fbLoginBtn)
        
        isPhoneRegScreenLoaded = false;
        self.facebookUISetup()
        
    }
    
    func facebookUISetup() {
        
        let fbAccessToken:String? = FBLoginManager.shared.accessToken
    
        if (fbAccessToken != nil) {
        
            self.fetchUserInfoFromFacebook(false)
        }
    }
    
    
    func fetchUserInfoFromFacebook (_ isCancelledByUsers:Bool){
        
        if (isCancelledByUsers){
            
            UIUtils.showAlertViewwithTitle("Alert", andMessage: "Please authorize TIL app to access your facebook detail for sucessful login.")
            
        }else  {
            UIUtils.showProgressView(view: self.view, animated: true)
            self.faceBookUserInfo(isCancelledByUsers)
        }
        
//        } else {
//            
//            let loginManager = FBSDKLoginManager ()
//            
//            loginManager.logIn(withReadPermissions: ["email"], from: self, handler: { (result, error) in
//                self.faceBookUserInfo((result?.isCancelled)!)
//            })
//        
//        }
    }
    
    func faceBookUserInfo (_ isCancelledByUsers:Bool) {
        
        if isCancelledByUsers {
            
            UIUtils.hideProgressView(view: self.view, animated: true)
            UIUtils.showAlertViewwithTitle("Alert", andMessage: "Please authorize TIL app to access your facebook detail for sucessful login.")
        }

        
            print ("Granted permissions")
        let rqstModel:APIRequestModel = APIRequestModel(baseUrl: "https://graph.facebook.com/", apiUrl: "me?fields=id,name,birthday,email,friends&access_token=\((FBLoginManager.shared.accessToken)!)", parameters: nil, httpMethodType: .get, encoding: encodingType.URL, isAuthHeaderRequired: false)
        rqstModel.isOtherAPI = true
        
        weak var weakSelf = self

        APIUtil().fetchData(rqstModel) { (response) in
            
            if ( response.isSuccess) {
//                let resultDictionary = response.responseDictionary
//                
//                
//                UserManager.sharedInstance().user = TILUser()
//                
//                if let socialId = resultDictionary["id"] as? String{
//                    
//                    UserManager.sharedInstance().user.socialAccount.socialId = socialId
//                }
//                
//                if let email = resultDictionary["email"] as? String {
//                    UserManager.sharedInstance().user.socialAccount.emailId = email
//                }
//                
//                if let name = resultDictionary["name"] as? String{
//                    UserManager.sharedInstance().user.socialAccount.name = name
//                }
//                
//                if let dob = resultDictionary["birthday"] as? String{
//                    UserManager.sharedInstance().user.dateOfBirth = dob
//                }
//                
//                if let friends = resultDictionary[ "friends"] as? [String:AnyObject]{
//                    
//                    if let summary = friends["summary"] as? [String:AnyObject]{
//                        let count = summary["total_count"]
//                        
//                        self.registerUserWithTotalFriendsCount(NSNumber(value:count as! Int))
//                    }else{
//                        self.registerUserWithTotalFriendsCount(NSNumber(value: -1 as Int))
//                    }
//                    
//                }else{
//                    self.registerUserWithTotalFriendsCount(NSNumber(value: -1 as Int))
//                }
//                
//                
            }else{
                
                DispatchQueue.main.async(execute: { () -> Void in
                    if weakSelf?.view != nil {
                        UIUtils.showProgressView(view: (weakSelf?.view)!, animated: true)
                    }
                })

                UIUtils.showAlertViewwithTitle("Oops!", andMessage: "Something went wrong. Please check your internet connection and try again.")
            }
        }
        
        
    }
    
//    func registerUserWithTotalFriendsCount(_ friendCount:NSNumber){
//        
//        if friendCount.int32Value > 0{
//            UserManager.sharedInstance().user.socialAccount.fbFriendCount =  friendCount
//        }else{
//            UserManager.sharedInstance().user.socialAccount.fbFriendCount = NSNumber(value: -1 as Int)
//        }
//        
//        UserManager.sharedInstance().fbRegistrationOnTIL { (responseObject) -> Void in
//            
//            if (responseObject?.errorObject.isSuccessAtServer)! {
//                
//                if (UserManager.sharedInstance().user.userType == TILUserType.default && !(CommonFunctions.checkValue(forNullOrBlank: UserManager.sharedInstance().user.sessionId))){
//                    
//                    self.dismissThisNav()
//                    
//                }else{
//                    self.openMobileVerification()
//                }
//            }else{
//                
//                DispatchQueue.main.async(execute: { () -> Void in
//                    UIHelper.hideLoaderView(self.view, animated: true)
//                })
//                UIUtils.makeAlertBox(responseObject?.errorObject.errorMessageFromServer, title: "Alert", button1: "OK", button2: nil, tag: 100, delegate: nil)
//            }
//            
//        }
//        
//    }
    
    func dismissThisNav(){
        self.navigationController?.dismiss(animated: true, completion: nil)
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        
//        delegate.launchMainApp()
        
    }
    
    func openMobileVerification(){
        
//        let storyBoard = UIStoryboard(name: UIConstants.getStoryboardIndentifier(.registration), bundle: nil)
//        let vc = storyBoard.instantiateViewController(withIdentifier: OTP_STORYBOARD_VIEW) as UIViewController
//        
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: FBLogin button delegate
    func loginButton(_ loginButton: FBLoginButton!, isCancelled: Bool, error: Error?) {
        
        if (error == nil) {
            self.fetchUserInfoFromFacebook(isCancelled)
        }else{
            
            UIUtils.makeAlertBox("Something went wrong. Please check you are logged in to facebook and try again.", title: "Oops!", button1: "OK", button2: "", alertTag: 10, delegate: nil)
            
        }
    
    }
    
    // delegate
    func skipLoginTapped() {
        self.skipLogin()
    }


}

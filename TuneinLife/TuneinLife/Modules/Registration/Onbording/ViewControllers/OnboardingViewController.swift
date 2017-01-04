//
//  OnboardingViewController.swift
//  CrownIt
//
//  Created by swarnima on 15/03/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
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



class OnboardingViewController: CRBaseViewController, FBLoginButtonDelegate, UIScrollViewDelegate, OnboardingType2ViewDelegate {
    
    var fbLogInView: UIView!
    var skipButton:UIButton!
    var skipButtonTypeII:UIButton!
    @IBOutlet weak var onboardingScrollView: UIScrollView!
    
    let SCREEN_WIDTH = AppConstants.ScreenWidth
    let SCREEN_HEIGHT = AppConstants.ScreenHeight
    
    var isPhoneRegScreenLoaded:Bool!
    
    var viewArray = [OnboardingView]()
    
    var firstOnboardingScreen:FirstOnboardingView!
    var secondOnboardingScreen:SecondOnboardingView!
    var thirdOnboardingScreen:ThirdOnboardingView!
    var fourthOnboardingScreen:FourthOnboardingView!
    var fifthOnboardingScreen:FifthOnvoardingView!
    
    var isTypeIOnboarding:Bool = false
    
    var onboardingType2View:OnboardingType2View!

    var xOffset :CGFloat!
    var yOffset :CGFloat!
    
    let flyingView = UIView()
    
    let flyingBill = UIImageView()
    let flyingCrown = UIImageView()
    let flyingTicket = UIImageView()
    
    var fBillInitialOrigin : CGPoint!
    var fBillFinalOrigin: CGPoint!
    var fBillFrame : CGRect!
    
    var fCrownInitialOrigin : CGPoint!
    var fCrownFinalOrigin: CGPoint!
    var fCrownFrame : CGRect!
    var fCrownFinalHeight : CGFloat!
    
    var fTicketInitialOrigin : CGPoint!
    var fTicketFinalOrigin: CGPoint!
    var fTicketFrame : CGRect!
    var fTicketFinalHeight : CGFloat!
    
    var fTicketInitialOrigin2 : CGPoint!
    var fTicketFinalOrigin2: CGPoint!
    var fTicketFrame2 : CGRect!
    var fTicketFinalHeight2 : CGFloat!
    
    var fCrownInitialOrigin1 : CGPoint!
    var fCrownFinalOrigin1: CGPoint!
    var fCrownFrame1 : CGRect!
    var fCrownFinalHeight1 : CGFloat!
    
    var crownFinalWidth : CGFloat!
    
    var firstScreenInitialCoordinates:CGPoint!
    var firstScreenFinalCoordinates:CGPoint!
    var onboardingImageView:UIImageView!
    var onboardingImageView2 : UIImageView!
    
    var circularImageView:UIImageView!
    var circularInitialCoordinates:CGPoint!
    var circularFinalCoordinates:CGPoint!
    var circleInitailFrame:CGRect!
    
    var pageControl:UIPageControl!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl = UIPageControl(frame: CGRect(x: AppConstants.ScreenWidth/2 - 100, y: AppConstants.ScreenHeight - 120, width: 200, height: 20))
        self.view.addSubview(pageControl)
        self.fetchOnboardingType()
        
        updateDeviceInfo()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configurePageControl(_ count:Int) {
        self.pageControl.numberOfPages = count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.lightGray
        self.pageControl.pageIndicatorTintColor = UIColor.groupTableViewBackground
        self.pageControl.currentPageIndicatorTintColor = UIColor(red: 59/255, green: 89/255, blue: 152/255, alpha: 1)
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
    
    internal func updateDeviceInfo(){
//        DeviceManager.sharedInstance().updateUserDeviceData { (response) in
//    }
    }
    
    func fetchOnboardingType() {
        
        if (UserDefaults.standard.object(forKey: "OnboardingScreenType") as? String != nil) {
        
            if UserDefaults.standard.object(forKey: "OnboardingScreenType") as! String  == "1" {
                isTypeIOnboarding = true
            } else {
                isTypeIOnboarding = false
            }
        
            if isTypeIOnboarding {
                self.setUpTypeIOnboarding()
            } else {
                self.setUpOnboardingType2()
            }
            
            
        } else {
        
            weak var weakSelf = self
//            UIHelper.showLoaderView(weakSelf!.view, animated: true)
            let model = OnboardingTypeModel()
            model.fetchOnboardingData({ (responseObj) in
                
                if responseObj.isSuccess {
                    UserDefaults.standard.set(model.onBoardingVersion, forKey: "OnboardingScreenType")
                } else {
                     UserDefaults.standard.set("1", forKey: "OnboardingScreenType")
                }
                self.fetchOnboardingType()
//                UIHelper.hideLoaderView(weakSelf!.view, animated: true)
            })
        }
    }
    
    
    func initScrollView (_ screens:CGFloat) {
        onboardingScrollView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH!, height: SCREEN_HEIGHT!)
        onboardingScrollView.contentSize=CGSize(width: screens*SCREEN_WIDTH!, height: SCREEN_HEIGHT! - 50);
        onboardingScrollView.isScrollEnabled=true;
        onboardingScrollView.showsHorizontalScrollIndicator=true;
        onboardingScrollView.isUserInteractionEnabled=true;
        onboardingScrollView.delegate=self;
        onboardingScrollView.isPagingEnabled=true;
        onboardingScrollView.bounces=false;
        self.view.addSubview(onboardingScrollView)
        
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

    
    func initializeTypeI() {
        firstOnboardingScreen = FirstOnboardingView()
        secondOnboardingScreen = SecondOnboardingView()
        thirdOnboardingScreen = ThirdOnboardingView()
        fourthOnboardingScreen = FourthOnboardingView()
        fifthOnboardingScreen = FifthOnvoardingView()
    }
    
    
    func setUpTypeIOnboarding() {
        self.initializeTypeI()
        self.initScrollView(5.0)
        self.setupScrollView()
        self.configurePageControl(5)
        self.setUpSkipButtonUI()
        
        
        fbLogInView = UIView ()
        fbLogInView.frame = CGRect(x: 0, y: SCREEN_HEIGHT! - 50, width: SCREEN_WIDTH!, height: 50)
        self.setUpFbLogIn()
        
        if self.skipButton != nil {
            self.view.bringSubview(toFront: skipButton)
        }
        if self.fbLogInView != nil {
            self.view.bringSubview(toFront: fbLogInView)
        }
        
        self.addTransitionToFirstScreen()
        self.addFlyingBill()
        self.addFlyingTicket()
        self.addFlyingCrown()
        
        self.addFlyingTicket2()
        self.addFlyingCrown1()
    }
    
    func setupScrollView ()  {
        
        firstOnboardingScreen.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH!, height: SCREEN_HEIGHT!)
        secondOnboardingScreen.frame = CGRect(x: SCREEN_WIDTH!, y: 0, width: SCREEN_WIDTH!, height: SCREEN_HEIGHT!)
        thirdOnboardingScreen.frame = CGRect(x: 2*SCREEN_WIDTH!, y: 0, width: SCREEN_WIDTH!, height: SCREEN_HEIGHT!)
        fourthOnboardingScreen.frame = CGRect(x: 3*SCREEN_WIDTH!, y: 0, width: SCREEN_WIDTH!, height: SCREEN_HEIGHT!)
        fifthOnboardingScreen.frame = CGRect(x: 4*SCREEN_WIDTH!, y: 0, width: SCREEN_WIDTH!, height: SCREEN_HEIGHT!)
        
        onboardingScrollView.addSubview(firstOnboardingScreen)
        onboardingScrollView.addSubview(secondOnboardingScreen)
        onboardingScrollView.addSubview(thirdOnboardingScreen)
        onboardingScrollView.addSubview(fourthOnboardingScreen)
        onboardingScrollView.addSubview(fifthOnboardingScreen)
        
        viewArray.append(firstOnboardingScreen)
        viewArray.append(secondOnboardingScreen)
        viewArray.append(thirdOnboardingScreen)
        viewArray.append(fourthOnboardingScreen)
        viewArray.append(fifthOnboardingScreen)
    
    }
    
    
    func addTransitionToFirstScreen () {
        
        firstScreenInitialCoordinates = CGPoint(x: firstOnboardingScreen.imageView.frame.origin.x, y: firstOnboardingScreen.imageView.frame.origin.y)
        firstScreenFinalCoordinates = CGPoint(x: SCREEN_WIDTH! + secondOnboardingScreen.imageView.frame.origin.x, y: secondOnboardingScreen.imageView.frame.origin.y)
        
        onboardingImageView = UIImageView()
        onboardingImageView.frame = firstOnboardingScreen.imageView.frame
        onboardingImageView.image = UIImage(named: "c1.png")
        self.onboardingScrollView.addSubview(onboardingImageView)
        
        onboardingImageView2 = UIImageView()
        onboardingImageView2.frame = firstOnboardingScreen.imageView.frame
        onboardingImageView2.image = UIImage(named: "c2_with-bill.png")
        onboardingImageView2.alpha = 0
        self.onboardingScrollView.addSubview(onboardingImageView2)

        
        circularImageView = UIImageView()
        circleInitailFrame = CGRect(x: self.onboardingImageView.frame.origin.x - 25, y: self.onboardingImageView.frame.origin.y - 25, width: self.onboardingImageView.frame.size.height + 50, height: self.onboardingImageView.frame.size.height + 50)
        circularImageView.frame = circleInitailFrame
        circularImageView.image = UIImage(named: "A1.png")
        self.onboardingScrollView.addSubview(circularImageView)
        circularInitialCoordinates = CGPoint(x: SCREEN_WIDTH!/2, y: 0.5 * SCREEN_HEIGHT!)
        circularFinalCoordinates = CGPoint(x: 1.5 * SCREEN_WIDTH! , y: 0.5 * SCREEN_HEIGHT!)
        secondOnboardingScreen.imageView.alpha = 0
        
    }
    
    func addFlyingBill() {
        
        fBillFrame = CGRect (x: secondOnboardingScreen.imageView.frame.origin.x + secondOnboardingScreen.imgRadius - 25 + SCREEN_WIDTH!, y: secondOnboardingScreen.imageView.frame.origin.y + secondOnboardingScreen.imgRadius - 20, width: 55, height: 0.52 * secondOnboardingScreen.imgRadius )   //75
        flyingBill.frame = fBillFrame
        flyingBill.image = UIImage(named: "bill_xxxhdpi")
        
        fBillInitialOrigin = fBillFrame.origin
        
        fBillFinalOrigin = CGPoint(x: 2*SCREEN_WIDTH! + thirdOnboardingScreen.imgRadius + 6, y: SCREEN_HEIGHT!/2)
        
        self.onboardingScrollView.addSubview(flyingBill)
    }
    
    func addFlyingCrown() {
        
        fCrownFrame = CGRect(x: 2 * SCREEN_WIDTH! + thirdOnboardingScreen.imgRadius - 5, y: thirdOnboardingScreen.imageView.frame.origin.y + 0.3 * thirdOnboardingScreen.imgRadius + 7  , width: 60, height: 45)
        flyingCrown.frame = fCrownFrame
        flyingCrown.image = UIImage (named: "crown_img")
        
        fCrownInitialOrigin = fCrownFrame.origin
        fCrownFinalOrigin = CGPoint(x: 3 * SCREEN_WIDTH! +  thirdOnboardingScreen.imgRadius + 42.5, y: thirdOnboardingScreen.imageView.frame.origin.y + 1.2 * thirdOnboardingScreen.imgRadius - 4 )
        fCrownFinalHeight = 30
        self.onboardingScrollView.addSubview(flyingCrown)
        
    }
    
    func addFlyingTicket() {
        
        fTicketFrame = CGRect(x: 2 * SCREEN_WIDTH! + thirdOnboardingScreen.imgRadius - 5 , y: thirdOnboardingScreen.imageView.frame.origin.y + 0.3 * thirdOnboardingScreen.imgRadius + 7 , width: 40, height: 25)
        flyingTicket.frame = fTicketFrame
        flyingTicket.image = UIImage (named: "ticket0001")
        
        fTicketInitialOrigin = fTicketFrame.origin
        fTicketFinalOrigin =  CGPoint(x: 3 * SCREEN_WIDTH! + thirdOnboardingScreen.imgRadius - 15, y: thirdOnboardingScreen.imageView.frame.origin.y + 1.2 * thirdOnboardingScreen.imgRadius )
        fTicketFinalHeight = 17
        self.onboardingScrollView.addSubview(flyingTicket)
        
    }
    
    
    func addFlyingTicket2 () {
        
        fTicketFrame2 = CGRect(x: fTicketFinalOrigin.x, y: fTicketFinalOrigin.y, width: fTicketFinalHeight * fTicketFrame.size.width / fTicketFrame.size.height, height: fTicketFinalHeight)
        fTicketFinalHeight2 =  fTicketFinalHeight * 1.4
        let ticketWidth = fTicketFinalHeight2 * fTicketFrame2.size.width / fTicketFrame2.size.height
        fTicketInitialOrigin2 = fTicketFinalOrigin
        fTicketFinalOrigin2 = CGPoint(x: 4 * SCREEN_WIDTH! + SCREEN_WIDTH!/2 - ticketWidth/2 , y: fifthOnboardingScreen.imageView.frame.origin.y + 1.6 * fifthOnboardingScreen.imgRadius )
        
    }
    
    func addFlyingCrown1 () {
        
        crownFinalWidth = fCrownFinalHeight * fCrownFrame.size.width / fCrownFrame.size.height
        
        fCrownFrame1 = CGRect(x: fCrownFinalOrigin.x, y: fCrownFinalOrigin.y, width: crownFinalWidth, height: fCrownFinalHeight)
        fCrownInitialOrigin1 = fCrownFinalOrigin
        
        let screenWidthFour = 4 * SCREEN_WIDTH!
        let screenWidthHalf = SCREEN_WIDTH!/2
        let crownFinalWidthHalf = crownFinalWidth/2
        
        let xVal = screenWidthFour + screenWidthHalf - crownFinalWidthHalf + 7
        let yVal = fifthOnboardingScreen.imageView.frame.origin.y + fifthOnboardingScreen.imgRadius/6 - 6
        
        fCrownFinalOrigin1 = CGPoint(x: xVal, y: yVal)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if isTypeIOnboarding == true {
            
            self.skipButton.isUserInteractionEnabled = false
            self.skipButton.alpha = 0
        
        if (scrollView.contentOffset.x <= SCREEN_WIDTH) {
            
            self.addTransition(onboardingImageView, initialCoordinates: firstScreenInitialCoordinates , finalCoordinates: firstScreenFinalCoordinates, scrollView: scrollView, subtractFromOffset: 0.0, offsetSpeed: 1.0)
            
            self.addTransition(onboardingImageView2, initialCoordinates: firstScreenInitialCoordinates , finalCoordinates: firstScreenFinalCoordinates, scrollView: scrollView, subtractFromOffset: 0.0, offsetSpeed: 1.0)
            
            self.reduceScaleWithFixedOrigin(circularImageView, scrollView: scrollView, finalHeight: 1, viewFrame: circleInitailFrame, initialCenter: circularInitialCoordinates, finalCenter: circularFinalCoordinates, subtractFromOffset: 0)
            self.decreaseAlpha(circularImageView, scrollView: scrollView, subtractFromOffest: 0)
            
            if scrollView.contentOffset.x >= 0.7 * SCREEN_WIDTH! {
                
                onboardingImageView2.alpha = (scrollView.contentOffset.x - 0.7 * SCREEN_WIDTH!) / (0.3 * SCREEN_WIDTH!)
                onboardingImageView.alpha = 1 - ((scrollView.contentOffset.x - 0.7 * SCREEN_WIDTH!) / (0.3 * SCREEN_WIDTH!))
            } else {
                onboardingImageView2.alpha = 0
                onboardingImageView.alpha = 1
            }
            self.onboardingScrollView.bringSubview(toFront: flyingBill)
            
            
        }
        
 
        if (scrollView.contentOffset.x > SCREEN_WIDTH && scrollView.contentOffset.x < 2 * SCREEN_WIDTH!) {
        
            flyingBill.alpha = 1
            
            self.addTransition(flyingBill, initialCoordinates: fBillInitialOrigin, finalCoordinates: fBillFinalOrigin, scrollView: scrollView, subtractFromOffset: SCREEN_WIDTH!, offsetSpeed: 1)
            
            self.scaleTHeFlyingVIew(flyingBill, scrollView: scrollView, finalHeight: 1.0, viewFrame: fBillFrame, initialCordinates: fBillInitialOrigin, finalCoordinates: fBillFinalOrigin, subtractFromOffset:  SCREEN_WIDTH!)

        } else {
            flyingBill.alpha = 0;
        }
        
        ///////////////  ticket and crown from screen 2 -> 3
        
        if (scrollView.contentOffset.x > 2 * SCREEN_WIDTH! && scrollView.contentOffset.x < 3 * SCREEN_WIDTH!) {
            
            self.addTransition(flyingCrown, initialCoordinates: fCrownInitialOrigin, finalCoordinates: fCrownFinalOrigin, scrollView: scrollView, subtractFromOffset: 2 * SCREEN_WIDTH!, offsetSpeed: 1.2)
            self.addTransition(flyingTicket, initialCoordinates: fTicketInitialOrigin, finalCoordinates: fTicketFinalOrigin, scrollView: scrollView, subtractFromOffset: 2 * SCREEN_WIDTH!, offsetSpeed : 1)
            
            self.scaleTHeFlyingVIew(flyingCrown, scrollView: scrollView, finalHeight: fCrownFinalHeight, viewFrame: fCrownFrame, initialCordinates: fCrownInitialOrigin, finalCoordinates: fCrownFinalOrigin, subtractFromOffset: SCREEN_WIDTH!)
            self.scaleTHeFlyingVIew(flyingTicket, scrollView: scrollView, finalHeight: fTicketFinalHeight, viewFrame: fTicketFrame, initialCordinates: fTicketInitialOrigin, finalCoordinates: fTicketFinalOrigin, subtractFromOffset: 2 * SCREEN_WIDTH!)
        }
        
        if scrollView.contentOffset.x <= 2 * SCREEN_WIDTH! {
            
            flyingCrown.alpha = 0
            flyingTicket.alpha = 0
        }else {
            flyingCrown.alpha = 1
            flyingTicket.alpha = 1
        }
        
        if (scrollView.contentOffset.x > 3 * SCREEN_WIDTH! && scrollView.contentOffset.x <= 4 * SCREEN_WIDTH!) {
            
            self.skipButton.isUserInteractionEnabled = true
            self.skipButton.alpha = 1
            
            self.addTransition(flyingTicket, initialCoordinates: fTicketInitialOrigin2, finalCoordinates: fTicketFinalOrigin2, scrollView: scrollView, subtractFromOffset: 3 * SCREEN_WIDTH!, offsetSpeed: 1.2)
            self.addTransition(flyingCrown, initialCoordinates: fCrownInitialOrigin1, finalCoordinates: fCrownFinalOrigin1, scrollView: scrollView, subtractFromOffset: 3 * SCREEN_WIDTH!, offsetSpeed: 1)
            self.scaleTHeFlyingVIew(flyingTicket, scrollView: scrollView, finalHeight: fTicketFinalHeight2, viewFrame: fTicketFrame2, initialCordinates: fTicketInitialOrigin2, finalCoordinates: fTicketFinalOrigin2, subtractFromOffset: 3 * SCREEN_WIDTH!)
        }
        
        }
    }
    
    
    
    func isCurrentVisibleView (_ scrollView:UIScrollView, theView:UIView) -> Bool {
        
        var visibleRect: CGRect!
        visibleRect = CGRect()
        visibleRect.size = scrollView.bounds.size;
        visibleRect.origin = scrollView.contentOffset;
        
        let containedViewRect: CGRect = theView.frame;
        
        if ( containedViewRect.contains(visibleRect) && !theView.isHidden )
        {
            return true
            
        } else {
            return false
        }
    }
    
    
    func addTransition (_ theView : UIView, initialCoordinates: CGPoint, finalCoordinates: CGPoint, scrollView:UIScrollView ,subtractFromOffset:CGFloat, offsetSpeed:CGFloat) -> Void {
        
        var path = CGPoint()
        path.x = scrollView.contentOffset.x
        path.y = ((finalCoordinates.y - initialCoordinates.y)/(finalCoordinates.x - initialCoordinates.x) * ((scrollView.contentOffset.x - subtractFromOffset) * offsetSpeed)) + initialCoordinates.y
        
        var coordX = theView.frame.origin.x
        
        if coordX <= finalCoordinates.x {
            
            coordX = initialCoordinates.x + offsetSpeed * (scrollView.contentOffset.x - subtractFromOffset)
            theView.frame.origin.y = path.y
        }
        
        if coordX > finalCoordinates.x {
            coordX = finalCoordinates.x
            theView.frame.origin.y = finalCoordinates.y
        }
        
            theView.frame.origin.x = coordX
        
        
    }
    
    
    func scaleTHeFlyingVIew (_ theView:UIView, scrollView:UIScrollView, finalHeight:CGFloat, viewFrame:CGRect,initialCordinates: CGPoint, finalCoordinates:CGPoint, subtractFromOffset:CGFloat) {
        
        theView.frame.size.height = viewFrame.height - ((viewFrame.height - finalHeight) * (scrollView.contentOffset.x - subtractFromOffset) / (finalCoordinates.x - initialCordinates.x))
        
        theView.frame.size.width = viewFrame.width * theView.frame.size.height / viewFrame.height
    }
    
    
    func reduceScaleWithFixedOrigin  (_ theView:UIView, scrollView:UIScrollView, finalHeight:CGFloat, viewFrame:CGRect,initialCenter: CGPoint, finalCenter:CGPoint, subtractFromOffset:CGFloat) {
        
        theView.center.x = initialCenter.x + scrollView.contentOffset.x
        
        theView.frame.size.height = viewFrame.height - ((viewFrame.height - finalHeight) * scrollView.contentOffset.x  / (finalCenter.x - initialCenter.x))
        
        theView.frame.size.width = viewFrame.width * theView.frame.size.height / viewFrame.height
        
        theView.center.x = initialCenter.x + scrollView.contentOffset.x
        theView.center.y = firstOnboardingScreen.imageView.center.y

    }
    
    func increaseAlpha (_ theView: UIView, scrollView: UIScrollView, subtractFromOffest:CGFloat) {
        
        var alpha : CGFloat
        alpha = (scrollView.contentOffset.x - subtractFromOffest) / SCREEN_WIDTH!
        
        theView.alpha = alpha
        
    }
    
    func decreaseAlpha(_ theView: UIView, scrollView: UIScrollView, subtractFromOffest:CGFloat) {
        
        var alpha : CGFloat
        alpha = 1 - (scrollView.contentOffset.x - subtractFromOffest) / SCREEN_WIDTH!
        
        theView.alpha = alpha
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
        //print("skip")
        
        weak var weakSelf = self
        
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
        
        let count = Int(self.onboardingScrollView.contentOffset.x)/Int(SCREEN_WIDTH!)
        
        var onboardingType = "OldAnimated"
        
        if isTypeIOnboarding == false {
            onboardingType = "NewStatic"
        }
//Prince
//        AppEventsHelper().track(onBoardingExit: count+1, totalScreens: 5, exitMethod: "Not Now", type: onboardingType)
        
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
            
            UIUtils.showAlertViewwithTitle("Alert", andMessage: "Please authorize Crownit app to access your facebook detail for sucessful login.")
            
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
            UIUtils.showAlertViewwithTitle("Alert", andMessage: "Please authorize Crownit app to access your facebook detail for sucessful login.")
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
//                UserManager.sharedInstance().user = CrownItUser()
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
//        UserManager.sharedInstance().fbRegistrationOnCrownit { (responseObject) -> Void in
//            
//            if (responseObject?.errorObject.isSuccessAtServer)! {
//                
//                if (UserManager.sharedInstance().user.userType == CrownItUserType.default && !(CommonFunctions.checkValue(forNullOrBlank: UserManager.sharedInstance().user.sessionId))){
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
        
        let count = Int(self.onboardingScrollView.contentOffset.x)/Int(SCREEN_WIDTH!)
        
        var onboardingType = "OldAnimated"
        
        if isTypeIOnboarding == false {
            onboardingType = "NewStatic"
        }
        
//        AppEventsHelper().track(onBoardingExit: count+1, totalScreens: 5, exitMethod: "Facebook", type: onboardingType)
    }
    
    // delegate
    func skipLoginTapped() {
        self.skipLogin()
    }


}

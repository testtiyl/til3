//
//  UIConstants.swift
//  CrownIt
//
//  Created by hitesh on 14/06/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
//

import UIKit

@objc enum  Storyboard:Int {
    case invite,main,hotel,wallet,voucherAndCoupons,outlet,explore,checkin,common,payment,registration,talktime,olaCabs,more,rewards,lottery,outletcheckin,rbl
}

@objc enum  ViewControllerIdentifier:Int {
    case inviteView,friendsContributionView,commonWebview,bookingSummaryView,redeemView,walletView,voucherAndCouponsView,mockupTestingView,viewCommonWebView,viewPromoCode,viewNotificationNew, CrownPass,rblSignupView,rblDocumentCollection, loginNavigation, onBording
}

class UIConstants: NSObject {    
    
    static func getStoryboardIndentifier(_ id:Storyboard) -> String{
        switch id {
        case .invite:
            return "Invite"
        case .main:
            return "Main"
        case .hotel:
            return "Hotels"
        case .wallet:
            return "Wallet"
        case .voucherAndCoupons:
            return "VoucherAndCoupon"
        case .outlet:
            return "Outlet"
        case .explore:
            return "Explore"
        case .checkin:
            return "Checkin"
        case .outletcheckin:
            return "OutletCheckin"
        case .common:
            return "Common"
        case .payment:
            return "Payment"
        case .registration:
            return "Registration"
        case .talktime:
            return "Talktime"
        case .olaCabs:
            return "OlaCabs"
        case .more:
            return "More"
        case .rewards:
            return "Redeem"
        case .lottery:
            return "Lottery"
        case .rbl:
            return "RBL"
        }
        
    }
    
    static func getViewControllerIdentifier(_ id:ViewControllerIdentifier) -> String{
        switch id {
        case .inviteView:
            return "InviteView"
            
        case .friendsContributionView:
            return "FriendsContributionView"
            
        case .commonWebview:
            return "viewCommonWebView"
        case .bookingSummaryView:
            return "storyboardHotelBookingList"
        case .redeemView:
            return "StoryboardIdRedemptionVC"
        case .walletView:
            return "viewWallet"
        case .voucherAndCouponsView:
            return "viewVouchersAndCoupons"
        case .mockupTestingView:
            return "MockupTestingView"
        case .viewPromoCode:
            return "viewPromoCode"
        case .viewNotificationNew:
            return "viewNotificationNew"
        case .CrownPass:
            return "CrownPassView"
        case .rblSignupView:
            return "RBLSignupViewIdentifier"
        case .rblDocumentCollection:
            return "DocumentCollectionViewIdentifier"
        case .onBording:
            return "onboardingViewControllerBoard"
        case .loginNavigation:
            return "navLogin"
        default:
            return ""
            
        }
        
        
    }
}

//
//  APIConstants.swift
//  CrownIt
//
//  Created by Veenus Chhabra on 12/01/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
//

import UIKit

enum APIType:String{

    case invite,sayThanks, campaignDetail, availPackageDetail, bookings, crownitPayFeedbackReason, submitCrownitPayFeedback, cancelCab, onboardingType, profileProgress, welcomeCardType, nudge, sendNudge, receiveNudge, earnings, vouchers, transactions, redeemOptions, marketingGroups, smartMessageBanner,getNotificationCount,checkTagging,setTaggingStatus, promotions,friendsActivity, pushNotificationTracking,generateOtpForOutlet,verifyOtpForOutlet,checkOtpForOutlet, voucherAllocate,crownpassDetail, outletlist, rblStatus,rblRegister,profileProgresswithfbId,outletDetails,outletFilterList, outletSpin,friendsVisited,smartWalletBalance,booking,outletBooking,applyPromo,ePayBalance,previousBooking, outletSearch,getLotteriesDetails,getParticipants, updateProfile, verifyPrimaryNumberOTP, userDataAndSettings, updatePrimaryNumber, updateAppRating, createGuestAccount, crownDetails, updateSettings, verifyOTP, updateLocationByCityId, updateFacebookLoginDetails, updateFacebookDetails, updateFacebookFriendsData

}
let ENVIRONMENT_PRODUCTION:String = ""
let ENVIRONMENT_MOBILETEST = ""

@objc class APIConstants: NSObject {
    
    static let ApiVersionKey = "Api-version"
    static let ApiVersionValue = "63"
    
    static let PlatformKey = "platform"
    static let PlatformValue = "ios"
    
    static let AppVersionKey = "app-version"
    
//MARK: Dev
    #if TEST_ENV
    static let  baseServerURL = "https://api-dev.crownit.in/api/"
    static let  baseNodeServerURL = "https://node-dev.crownit.in/api/"
    static let APPTRACER_MODE = 0
    
    static let  PaymentEnvironment:String = ENVIRONMENT_MOBILETEST
    static let  PayUKey:String = "gtKFFx"

    static let  PayTmMID:String = "GoldVI44480616073916"
    static let  PayTmMerchantKey:String = "PUvBLQaNGE16Pz2K"
    static let  PayTmWebsite:String = "GoldVIPwap"
    static let  PayTmChannedID:String = "WAP"
    static let  PayTmIndustryType:String = "Retail"
    static let  isPayTmProduction:Bool = false
    
    static let  isMockupTestingEnabled:Bool = true
    

    static let  HelpUrl = "https://node-dev.crownit.in/#/home/contactform?user_id={:userId}"
    
    static let zomatoAPIKey = "orderingsdkapikey"
    static let zomatoSecretKey = "secretkey"
    
//MARK: Staging
    #elseif PROD_STAGING
    static let  baseServerURL = "https://api-staging.crownit.in/api/"   // staging
    
    static let  baseNodeServerURL = "https://nodeserver.crownit.in/api/"
    
    static let APPTRACER_MODE = 0
    
    static let  PaymentEnvironment:String = ENVIRONMENT_PRODUCTION
    static let  PayUKey:String = "ZVKhWM"
    
    static let  PayTmMID:String = "crowni83802033533123"
    static let  PayTmMerchantKey:String = "cFLt7o3u4!#kGEDi"
    static let  PayTmWebsite:String = "crownitwap"
    static let  PayTmChannedID:String = "WAP"
    static let  PayTmIndustryType:String = "Retail107"
    static let  isPayTmProduction:Bool = true
    
    static let  HelpUrl = "https://nodeserver.crownit.in/#/home/contactform?user_id={:userId}"
    
    static let  isMockupTestingEnabled:Bool = false
    
    
    static let zomatoAPIKey = "86733eb09ab3bc43fcf3339a68601190"
    static let zomatoSecretKey = "e1863719dcafa0a18b7d6c582b90ed41"
    
    #else
//MARK: Production
     static let  baseServerURL = "https://100apipers.crownit.in/api/"  // live
    
    static let  baseNodeServerURL = "https://nodeserver.crownit.in/api/"
    
    static let APPTRACER_MODE = 0
    
    static let  PaymentEnvironment:String = ENVIRONMENT_PRODUCTION
    static let  PayUKey:String = "ZVKhWM"
    
    static let  PayTmMID:String = "crowni83802033533123"
    static let  PayTmMerchantKey:String = "cFLt7o3u4!#kGEDi"
    static let  PayTmWebsite:String = "crownitwap"
    static let  PayTmChannedID:String = "WAP"
    static let  PayTmIndustryType:String = "Retail107"
    static let  isPayTmProduction:Bool = true

    static let  HelpUrl = "https://nodeserver.crownit.in/#/home/contactform?user_id={:userId}"
    
    static let  isMockupTestingEnabled:Bool = false
    
    
    static let zomatoAPIKey = "86733eb09ab3bc43fcf3339a68601190"
    static let zomatoSecretKey = "e1863719dcafa0a18b7d6c582b90ed41"
    
    #endif
    
    static let zomatoOutletId = "33017"
    
    
    /// get API url
    
    static func getAPIUrl(_ apiType:APIType)->String{
        switch (apiType){
        case .invite:
            return "referrals-data"
        case .sayThanks:
            return "lotteries/acknowledge"
        case .campaignDetail:
            return "campaigns/[:campaignId]"
        case .availPackageDetail:
            return  "purchases/[:purchaseId]"
        case .bookings:
            return "bookings"
        case .crownitPayFeedbackReason:
            return "feedback-meta-data"
        case .submitCrownitPayFeedback:
            return "feedback-data"
        case .cancelCab:
            return "cancelCab"
        case .onboardingType:
            return "next-screen?[:tutorialVersion]"
        case .profileProgress:
            return "profile-progress/[user_id]"
        case .welcomeCardType:
            return "welcome-card-details"
        case .nudge:
            return "referrals"
        case .sendNudge:
            return "send-nudge"
        case .receiveNudge:
            return "nudge"
        case .earnings:
            return "earnings?page_no=[pageNumber]"
        case .vouchers:
            return "vouchers/[voucherTypeID]?type=useType&outletId=[:outletID]&userOfferId=[:userOfferId]"
        case .transactions:
            return "users/[userId]/transactions?page_no=[pageNumber]"
        case .redeemOptions:
            return "redemptions"
        case .smartMessageBanner:
            return "smart-messages"
        case .getNotificationCount:
            return "notifications/count"
        case .checkTagging:
            return "crownpasses/tagged"
        case .setTaggingStatus:
            return "crownpasses/{:crownpassId}/tagged"
        case .pushNotificationTracking:
            return "v2/notification/push"
        case .generateOtpForOutlet:
            return "v2/otp/generate/[user_id]"
        case .verifyOtpForOutlet:
            return "/v2/otp/verify/[user_id]"
        case .checkOtpForOutlet:
            return "/v2/otp/[user_id]"
        case .voucherAllocate:
            return "voucher/allocate/[userVoucherMapId]"
        case .profileProgresswithfbId:
            return "profile-progress/[user_id]"
            
        default:
            return ""
      

        }
    }
}

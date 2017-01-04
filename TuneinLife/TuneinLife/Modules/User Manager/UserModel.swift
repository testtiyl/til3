//
//  UserModel.swift
//  Crownit
//
//  Created by hitesh on 01/01/17.
//  Copyright © 2017 GoldVip Technology Solutions Pvt. Ldt. All rights reserved.
//

import UIKit
import ObjectMapper

class UserModel: BaseDataModel {
    
    
    //SocialAccountModel
    var name:String?
    var socialId:String?
    var emailId:String?
    var firstName:String?
    var lastName:String?

    var gender:CrownItUserGender = .None
    var fbFriendCount = 0

    var userId:String?
    var sessionId:String?
    
    //CrownDetailModel
    var currentCrowns = 0
    var lifeTimeCrowns = 0
    var e2rIncrementRate = 0
    var e2rCurrentValue = 0
    var isE2REnabled = false
    
    //SettingModel
    var canShowCheckinDateTime = false
    var allowMultiLevelMarketing = false
    var userType:CrownItUserType = .None
    var checkinOtpHandshake = false
    
    var isNewUser = false
    var isAdmin = false
    var remoteUserType:String?
    
    //MobileNumberModel
    var mobileNumber:String?
    var operatorName:String?
    var otp:String?
    var operatorType:String?
    var connectionType:MobileNumberConnectionType = .None
    
    var dateOfBirth:String?
    var cityId:String?
    var cityName:String?
    var totalFbFriends = 0
    var businessTransactions = 0
    var engagementTransactions = 0
    var revenueTransactions = 0
    var lifetimeTickets = 0
//Prince
//    var crownitFriendsArray:Array<>
    var alternateEmail:String?
    var linkedAccounts:NSArray?
    var deviceToken:String?
    var olaAccessToken:String?
//    var userSignupdate:String?
    var userSignupMonth:String?
    var crownItFriend:String?

    //ReferrerModel
    var isReferrerAdded = false
    var isReferrerAllowed = false
    
    
    var userSignupdate:String {
        set {
            if ValidationUtils.isStringValid(userSignupdate) {
                var arr = userSignupdate.components(separatedBy: "-")
                if arr.count == 3 {
                    self.userSignupMonth = "\(arr[1])-\(arr[2])"
                }
            }
            
        }
        get {
            return self.userSignupdate
        }
    }
    
//Prince
    
    func hasSession() -> Bool {
        return ValidationUtils.isStringValid(self.sessionId)
    }
    
    func clearUserDetails() {
        if .None != userType {
            self.userType = .None
            //self.userId  = @"";
            self.sessionId = ""
            self.alternateEmail = ""
            self.dateOfBirth = ""
            self.name = ""
            self.emailId = ""
            self.firstName = ""
            self.lastName = ""
            self.fbFriendCount = 0
            self.totalFbFriends = 0
            self.e2rCurrentValue = 0
            self.currentCrowns = 0
            self.lifeTimeCrowns = 0
            self.lifetimeTickets = 0
        }
    }
    
    func updateProfile(completion: @escaping (_ error:Error?, _ responseObject: UserModel?) -> Void) {
        if !String.isValid(self.userId) {
            self.userId = ""
        }
        let requestParameters:[String: Any]=["dob": self.dateOfBirth ?? "", "emailId": self.alternateEmail ?? "", "simType": self.connectionType, "dob": self.dateOfBirth ?? "", "operator": self.operatorName ?? "", "isMlm":self.allowMultiLevelMarketing, "showCheckinDatetime":self.canShowCheckinDateTime]
        
        let urlParameters:[String: Any] = ["[user_id]": self.userId ?? ""]
        DataFactory.getData(.updateProfile, requestParams:requestParameters, urlParams: urlParameters, model: self) { (error, parsedModel) in
            
            if nil == error {
                let response = (parsedModel as! UserModel)
                
                completion(error,self)
            } else {
                completion(error,nil)
            }
        }
    }
    
    func verifyContactUpdate(completion: @escaping (_ error:Error?, _ responseObject: UserModel?) -> Void) {
        if !String.isValid(self.userId) {
            self.userId = ""
        }
        let requestParameters:[String: Any] = ["otp": self.otp ?? ""]
        let urlParameters:[String: Any] = ["[userId]": self.userId ?? ""]

        DataFactory.getData(.verifyPrimaryNumberOTP, requestParams:requestParameters, urlParams: urlParameters, model: self) { (error, parsedModel) in
            
            if nil == error{
                let response = (parsedModel as! UserModel)
                completion(error,self)
            } else {
                completion(error,nil)
            }
            
        }
    }
    
    func userDataAndSettings(completion: @escaping (_ error:Error?, _ responseObject: UserModel?) -> Void) {
        
        DataFactory.getData(.userDataAndSettings, requestParams:nil, urlParams: nil, model: self) { (error, parsedModel) in
            
            if nil == error{
                let response = (parsedModel as! UserModel)
                completion(error,self)
            } else {
                completion(error,nil)
            }
            
        }
    }
    func updateContactNumber(completion: @escaping (_ error:Error?, _ responseObject: UserModel?) -> Void) {
        
        if !String.isValid(self.userId) {
            self.userId = ""
        }
        let requestParameters:[String: Any] = ["phoneNo": self.mobileNumber ?? ""]
        let urlParameters:[String: Any] = ["[user_id]": self.userId ?? ""]
        
        DataFactory.getData(.updatePrimaryNumber, requestParams:requestParameters, urlParams: urlParameters, model: self) { (error, parsedModel) in
            
            if nil == error{
                let response = (parsedModel as! UserModel)
                completion(error,self)
            } else {
                completion(error,nil)
            }
            
        }
    }
    func updateAppRating(completion: @escaping (_ error:Error?, _ responseObject: UserModel?) -> Void) {
        
        if !String.isValid(self.userId) {
            self.userId = ""
        }
        let urlParameters:[String: Any] = ["[user_id]": self.userId ?? ""]
        
        DataFactory.getData(.updateAppRating, requestParams:nil, urlParams: urlParameters, model: self) { (error, parsedModel) in
            
            if nil == error{
                let response = (parsedModel as! UserModel)
                completion(error,self)
            } else {
                completion(error,nil)
            }
            
        }
    }
    
    func skipRegistration(completion: @escaping (_ error:Error?, _ responseObject: UserModel?) -> Void) {
//Prince
        let registrationStatusID = ""//DeviceUtil.sharedInstance.deviceModel.registrationStatusId
        
        let urlParameters:[String: Any] = ["[registrationStatusId]": registrationStatusID ]
        
        DataFactory.getData(.createGuestAccount, requestParams:nil, urlParams: urlParameters, model: self) { (error, parsedModel) in
            
            if nil == error{
                let response = (parsedModel as! UserModel)
                completion(error,self)
            } else {
                completion(error,nil)
            }
            
        }
    }
    
    func updateCrownDetails(completion: @escaping (_ error:Error?, _ responseObject: UserModel?) -> Void) {
        
        if !String.isValid(self.userId) {
            self.userId = ""
        }
        let urlParameters:[String: Any] = ["[user_id]": self.userId ?? ""]
        
        DataFactory.getData(.updateAppRating, requestParams:nil, urlParams: urlParameters, model: self) { (error, parsedModel) in
            
            if nil == error{
                let response = (parsedModel as! UserModel)
                completion(error,self)
            } else {
                completion(error,nil)
            }
            
        }
    }
    
    func updateSettings(completion: @escaping (_ error:Error?, _ responseObject: UserModel?) -> Void) {
        if !String.isValid(self.userId) {
            self.userId = ""
        }
        var requestParameters:[String: Any] = [:]
        
        if self.isAdmin {
            requestParameters = ["isMlm":self.allowMultiLevelMarketing, "showCheckinDatetime":self.canShowCheckinDateTime, "checkinOtpHandshake":self.checkinOtpHandshake, "userType":self.userType]
        } else {
            requestParameters = ["isMlm":self.allowMultiLevelMarketing, "showCheckinDatetime":self.canShowCheckinDateTime]
        }
        
        let urlParameters:[String: Any] = ["[user_id]": self.userId ?? ""]
        DataFactory.getData(.updateProfile, requestParams:requestParameters, urlParams: urlParameters, model: self) { (error, parsedModel) in
            
            if nil == error {
                let response = (parsedModel as! UserModel)
                
                completion(error,self)
            } else {
                completion(error,nil)
            }
        }
    }
    
    func createCrownitUser(completion: @escaping (_ error:Error?, _ responseObject: UserModel?) -> Void) {
        if !String.isValid(self.userId) {
            self.userId = ""
        }
        let requestParameters:[String: Any] = ["fbId":self.socialId ?? "", "deviceId":"DeviceManger", "phoneNo":self.mobileNumber ?? "", "fbFriendsCount":self.fbFriendCount]
        
        DataFactory.getData(.updateProfile, requestParams:requestParameters, urlParams: nil, model: self) { (error, parsedModel) in
            
            if nil == error {
                let response = (parsedModel as! UserModel)
                
                completion(error,self)
            } else {
                completion(error,nil)
            }
        }
    }
    
    
    func verifyCrownItUserOtp(completion: @escaping (_ error:Error?, _ responseObject: UserModel?) -> Void) {
        if !String.isValid(self.userId) {
            self.userId = ""
        }
//Prince - deivce manager and location manager
        let requestParameters:[String: Any] = ["fbId":self.socialId ?? "", "fbEmail":self.emailId ?? "", "fbName":self.name ?? "", "deviceId":"DeviceManger", "otp":self.otp ?? "", "longitude":"locatioinManager", "latitude":"locatino",  "platform":"device", "gcmId":"device or apputil"]
        let urlParameters:[String: Any] = ["[user_id]": self.userId ?? ""]

        DataFactory.getData(.verifyOTP, requestParams:requestParameters, urlParams: urlParameters, model: self) { (error, parsedModel) in
            
            if nil == error {
                let response = (parsedModel as! UserModel)
                
                completion(error,self)
            } else {
                completion(error,nil)
            }
        }
    }
    
    func updateLocationAtServerByCityId(completion: @escaping (_ error:Error?, _ responseObject: UserModel?) -> Void) {
        if !String.isValid(self.userId) {
            self.userId = ""
        }
        //Prince - deivce manager and location manager
        let requestParameters:[String: Any] = ["cityId":self.cityId ?? ""]
        let urlParameters:[String: Any] = ["[user_id]": self.userId ?? ""]

        DataFactory.getData(.updateLocationByCityId, requestParams:requestParameters, urlParams: urlParameters, model: self) { (error, parsedModel) in
            
            if nil == error {
                let response = (parsedModel as! UserModel)
                
                completion(error,self)
            } else {
                completion(error,nil)
            }
        }
    }
    
    func fbRegistrationOnCrownit(completion: @escaping (_ error:Error?, _ responseObject: UserModel?) -> Void) {
//Prince
        var deviceId = ""//device manager
        
        if !String.isValid(deviceId) {
            deviceId = ""
        }
        let requestParameters:[String: Any] = ["fbId":self.socialId ?? "", "fbEmail":self.emailId ?? "", "fbId":self.cityId ?? ""]

        let urlParameters:[String: Any] = ["[device_id]": deviceId]
        
        DataFactory.getData(.updateFacebookLoginDetails, requestParams:requestParameters, urlParams: urlParameters, model: self) { (error, parsedModel) in
            
            if nil == error {
                let response = (parsedModel as! UserModel)
                
                completion(error,self)
            } else {
                completion(error,nil)
            }
        }
    }
    
    func updateFacebookDetails(fbUserModel:FBUserModel, userID:String?, completion: @escaping (_ error:Error?, _ responseObject: UserModel?) -> Void) {
        //Prince

        let requestParameters:[String: Any] = ["education":fbUserModel.education ?? "", "fbFriendCount":fbUserModel.friendCount, "fbMaritualStatus":fbUserModel.maritualStatus ?? "", "fbSex":fbUserModel.gender ?? "", "fbCity":fbUserModel.city ?? "", "fbDob":fbUserModel.dateOfBirth ?? "", "fbWorksAt":fbUserModel.worksAt ?? ""]
        
        let urlParameters:[String: Any] = ["[user_id]": userID ?? ""]
        
        DataFactory.getData(.updateFacebookDetails, requestParams:requestParameters, urlParams: urlParameters, model: self) { (error, parsedModel) in
            
            if nil == error {
                let response = (parsedModel as! UserModel)
                
                completion(error,self)
            } else {
                completion(error,nil)
            }
        }
    }
    
    func updateFacebookFriends(facebookFriends:String?, completion: @escaping (_ error:Error?, _ responseObject: UserModel?) -> Void) {
        //Prince
        
        if !ValidationUtils.isStringValid(facebookFriends) {
            return
        }
        
        let requestParameters:[String: Any] = ["fbFriendsData":facebookFriends ?? ""]
        
        DataFactory.getData(.updateFacebookFriendsData, requestParams:requestParameters, urlParams: nil, model: self) { (error, parsedModel) in
            
            if nil == error {
                let response = (parsedModel as! UserModel)
                
                completion(error,self)
            } else {
                completion(error,nil)
            }
        }
    }
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as! String?
        self.socialId = aDecoder.decodeObject(forKey: "socialId")  as! String?
        self.emailId = aDecoder.decodeObject(forKey: "emailId")  as! String?
        self.firstName = aDecoder.decodeObject(forKey: "firstName")  as! String?
        self.lastName = aDecoder.decodeObject(forKey: "lastName")  as! String?
        self.gender = aDecoder.decodeObject(forKey: "gender") as! CrownItUserGender
        self.fbFriendCount = aDecoder.decodeInteger(forKey: "fbFriendCount")
        self.userId = aDecoder.decodeObject(forKey: "userId")  as! String?
        self.sessionId = aDecoder.decodeObject(forKey: "sessionId")  as! String?
        self.currentCrowns = aDecoder.decodeInteger(forKey: "currentCrowns")
        self.lifeTimeCrowns = aDecoder.decodeInteger(forKey: "lifeTimeCrowns")
        self.e2rIncrementRate = aDecoder.decodeInteger(forKey: "e2rIncrementRate")
        self.e2rCurrentValue = aDecoder.decodeInteger(forKey: "e2rCurrentValue")
        self.isE2REnabled = aDecoder.decodeBool(forKey: "isE2REnabled")
        self.canShowCheckinDateTime = aDecoder.decodeBool(forKey: "canShowCheckinDateTime")
        self.allowMultiLevelMarketing = aDecoder.decodeBool(forKey: "allowMultiLevelMarketing")
        self.userType = aDecoder.decodeObject(forKey: "userType") as! CrownItUserType
        self.checkinOtpHandshake = aDecoder.decodeBool(forKey: "checkinOtpHandshake")
        self.isNewUser = aDecoder.decodeBool(forKey: "isNewUser")
        self.isAdmin = aDecoder.decodeBool(forKey: "isAdmin")
        self.remoteUserType = aDecoder.decodeObject(forKey: "remoteUserType") as? String
        self.mobileNumber = aDecoder.decodeObject(forKey: "mobileNumber") as? String
        self.operatorName = aDecoder.decodeObject(forKey: "operatorName") as? String
        self.otp = aDecoder.decodeObject(forKey: "otp") as? String
        self.operatorType = aDecoder.decodeObject(forKey: "operatorType") as? String
        self.connectionType = aDecoder.decodeObject(forKey: "connectionType") as! MobileNumberConnectionType
        self.dateOfBirth = aDecoder.decodeObject(forKey: "dateOfBirth") as? String
        self.cityId = aDecoder.decodeObject(forKey: "cityId") as? String
        self.cityName = aDecoder.decodeObject(forKey: "cityName") as? String
        self.totalFbFriends = aDecoder.decodeInteger(forKey: "totalFbFriends")
        self.businessTransactions = aDecoder.decodeInteger(forKey: "businessTransactions")
        self.engagementTransactions = aDecoder.decodeInteger(forKey: "engagementTransactions")
        self.revenueTransactions = aDecoder.decodeInteger(forKey: "revenueTransactions")
        self.lifetimeTickets = aDecoder.decodeInteger(forKey: "lifetimeTickets")

        self.alternateEmail = aDecoder.decodeObject(forKey: "alternateEmail") as? String
        self.deviceToken = aDecoder.decodeObject(forKey: "deviceToken") as? String
        self.olaAccessToken = aDecoder.decodeObject(forKey: "olaAccessToken") as? String
        self.userSignupMonth = aDecoder.decodeObject(forKey: "userSignupMonth") as? String
        self.crownItFriend = aDecoder.decodeObject(forKey: "crownItFriend") as? String

        self.isReferrerAdded = aDecoder.decodeBool(forKey: "isReferrerAdded")
        self.isReferrerAllowed = aDecoder.decodeBool(forKey: "isReferrerAllowed")
        self.linkedAccounts = aDecoder.decodeObject(forKey: "linkedAccounts") as! NSArray?
//Prince
//        self.crownitFriendsArray = aDecoder.decodeObject(forKey: "crownitFriendsArray")
    }
    
    required init?(map: Map) {
        
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(socialId, forKey: "socialId")
        aCoder.encode(emailId, forKey: "emailId")
        aCoder.encode(firstName, forKey: "firstName")
        aCoder.encode(lastName, forKey: "lastName")
        aCoder.encode(gender, forKey: "gender")
        aCoder.encode(userId, forKey: "userId")
        aCoder.encode(userType, forKey: "userType")
        aCoder.encode(remoteUserType, forKey: "remoteUserType")
        aCoder.encode(mobileNumber, forKey: "mobileNumber")
        aCoder.encode(operatorName, forKey: "operatorName")
        aCoder.encode(otp, forKey: "otp")
        aCoder.encode(operatorType, forKey: "operatorType")
        aCoder.encode(connectionType, forKey: "connectionType")
        aCoder.encode(dateOfBirth, forKey: "dateOfBirth")
        aCoder.encode(cityId, forKey: "cityId")
        aCoder.encode(cityName, forKey: "cityName")
        aCoder.encode(alternateEmail, forKey: "alternateEmail")
        aCoder.encode(deviceToken, forKey: "deviceToken")
        aCoder.encode(olaAccessToken, forKey: "olaAccessToken")
        aCoder.encode(userSignupMonth, forKey: "userSignupMonth")
        aCoder.encode(crownItFriend, forKey: "crownItFriend")
        aCoder.encode(linkedAccounts, forKey: "linkedAccounts")
//        aCoder.encode(crownitFriendsArray, forKey: "crownitFriendsArray")
        //Int
        aCoder.encode(fbFriendCount, forKey: "fbFriendCount")
        aCoder.encode(currentCrowns, forKey: "currentCrowns")
        aCoder.encode(lifeTimeCrowns, forKey: "lifeTimeCrowns")
        aCoder.encode(e2rIncrementRate, forKey: "e2rIncrementRate")
        aCoder.encode(e2rCurrentValue, forKey: "e2rCurrentValue")
        aCoder.encode(totalFbFriends, forKey: "totalFbFriends")
        aCoder.encode(businessTransactions, forKey: "businessTransactions")
        aCoder.encode(engagementTransactions, forKey: "engagementTransactions")
        aCoder.encode(revenueTransactions, forKey: "revenueTransactions")
        aCoder.encode(lifetimeTickets, forKey: "lifetimeTickets")
        //Bool
        aCoder.encode(isE2REnabled, forKey: "isE2REnabled")
        aCoder.encode(canShowCheckinDateTime, forKey: "canShowCheckinDateTime")
        aCoder.encode(allowMultiLevelMarketing, forKey: "allowMultiLevelMarketing")
        aCoder.encode(checkinOtpHandshake, forKey: "checkinOtpHandshake")
        aCoder.encode(isNewUser, forKey: "isNewUser")
        aCoder.encode(isAdmin, forKey: "isAdmin")
        aCoder.encode(isReferrerAdded, forKey: "isReferrerAdded")
        aCoder.encode(isReferrerAllowed, forKey: "isReferrerAllowed")
    }

    
}
enum CrownItUserType {
    case None, Default, LoggedIn
}
enum MobileNumberConnectionType {
    case None, Prepaid, Postpaid
}
enum UserDataSaveType {
    case None, API, LocalLocation, LocalAll
}
enum CrownItUserGender {
    case None, Male, Female
}


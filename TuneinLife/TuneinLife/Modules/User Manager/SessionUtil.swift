//
//  SessionUtil.swift
//  Crownit
//
//  Created by hitesh on 02/01/17.
//  Copyright © 2017 GoldVip Technology Solutions Pvt. Ldt. All rights reserved.
//

import UIKit

class SessionUtil: NSObject {
    
    static let sharedInstance = SessionUtil()

    var isLoggedIn:Bool = false

    var userModel:UserModel?
    
    func updateProfile(userModel: UserModel, completion: @escaping (_ responseObject: UserModel) -> Void) {
        userModel.updateProfile { (error, userModel) in

        }
    }
    
    func verifyContactUpdateWithOTP(otp: String, completion: @escaping (_ responseObject: UserModel) -> Void) {

//        var usrModel:UserModel = UserModel()
//        usrModel.userId = self.userModel?.userId
        self.userModel?.otp = otp
        self.userModel?.verifyContactUpdate { (error, userModel) in
            
        }
    }
    func updateContactNumber(mobileNumber: String, completion: @escaping (_ responseObject: UserModel) -> Void) {
        
//        var usrModel:UserModel = UserModel()
//        usrModel.userId = self.userModel?.userId
        self.userModel?.mobileNumber = mobileNumber
        
        self.userModel?.updateContactNumber { (error, userModel) in
            
        }
    }
    
    func updateAppRating(appRating: String, completion: @escaping (_ responseObject: UserModel) -> Void) {
        
//        var usrModel:UserModel = UserModel()
//        usrModel.userId = self.userModel?.userId
        
        self.userModel?.updateAppRating { (error, userModel) in
            
        }

    }
//Prince
    //func fetchLinkedAccountsWithCompletionBlock
    
    func isSessionValid() -> Bool {
        if ValidationUtils.isStringValid(self.userModel?.sessionId) {
            return true
        } else {
            return false
        }
    }
    
    func updateInfoWithUserModel(userModel: UserModel, apiType:APIType, completion: @escaping (_ responseObject: UserModel) -> Void) {
        
        if apiType == .updatePrimaryNumber {
            if self.userModel?.userId == userModel.userId {
                self.userModel?.updateContactNumber(completion: { (error, userModel) in
                    
                })
            }
        } else if apiType == .verifyPrimaryNumberOTP {
            //do nothing and don't delete this case
        }
    }
    func skipRegistration(completion: @escaping (_ responseObject: UserModel) -> Void) {
        
        self.userModel?.skipRegistration(completion: { (error, userModel) in
            
        })
    }
    
    func fbRegistrationOnCrownit(completion: @escaping (_ responseObject: UserModel) -> Void) {
        
        self.userModel?.fbRegistrationOnCrownit(completion: { (error, userModel) in
            
        })
    }
    
    func verifyCrownItUserOtp(completion: @escaping (_ responseObject: UserModel) -> Void) {
        
        self.userModel?.verifyCrownItUserOtp(completion: { (error, userModel) in
            
        })
    }
    
    func createCrownitUser(completion: @escaping (_ responseObject: UserModel) -> Void) {
        
        self.userModel?.createCrownitUser(completion: { (error, userModel) in
            
        })
    }
    func updateLocationAtServerByCityId(cityId:String, completion: @escaping (_ responseObject: UserModel) -> Void) {
        
        self.userModel?.cityId = cityId
        self.userModel?.updateLocationAtServerByCityId(completion: { (error, userModel) in
            
        })
    }
    func updateCrownDetails(completion: @escaping (_ responseObject: UserModel) -> Void) {
        
        self.userModel?.updateCrownDetails(completion: { (error, userModel) in
            
        })
    }
    func updateSettingsAtServer(canShowCheckinDateTime:Bool, isMlm:Bool, remoteUserType:String, checkinOtpHandshake:Bool, completion: @escaping (_ responseObject: UserModel) -> Void) {
        
        self.userModel?.canShowCheckinDateTime = canShowCheckinDateTime
        self.userModel?.allowMultiLevelMarketing = isMlm
        self.userModel?.remoteUserType = remoteUserType
        self.userModel?.checkinOtpHandshake = checkinOtpHandshake
        
        self.userModel?.updateSettings(completion: { (error, userModel) in
            
        })
    }
    
    
    
    func authHeader() -> String {
        let userIdPwdStr = "\((self.userModel?.userId)!):\((self.userModel?.sessionId)!)"
        let userData = userIdPwdStr.data(using: String.Encoding.ascii)
        return "Basic \(userData?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0)))"
    }
    
    
    
}

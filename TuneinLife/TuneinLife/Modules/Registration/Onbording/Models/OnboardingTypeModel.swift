//
//  OnboardingTypeModel.swift
//  CrownIt
//
//  Created by swarnima on 02/08/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
//

import UIKit

class OnboardingTypeModel: NSObject {

    var screen:String?
    var onBoardingVersion:String?
    
    func fetchOnboardingData(_ completionBlock:@escaping (_ responseObj:APIResponseModel)->Void){
        
        var apiUrl = APIConstants.getAPIUrl(APIType.onboardingType)
        apiUrl = apiUrl.replacingOccurrences(of: "[:tutorialVersion]", with: "tutorialVersion=1")
        let rqstModel = APIRequestModel(apiUrl: apiUrl, parameters: [:], httpMethodType: .get, encoding: encodingType.URL,isAuthHeaderRequired: true)
        rqstModel.baseUrl = APIConstants.baseNodeServerURL
        APIUtil().fetchData(rqstModel) { (response) in
            if (response.isSuccess){
               
                self.onBoardingVersion = AppUtils.getStringFromAnyType(response.responseDictionary["onBoardingTutorialVersion"])
            }
            response.customModel = self
            completionBlock(response)
        }
    }
}

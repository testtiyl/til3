//
//  UIUtils.swift
//  til2
//
//  Created by Hitesh Kumar on 27/05/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

import UIKit

class UIUtils: NSObject {
    
    class func showAlertViewwithTitle(_ Title: String, andMessage Message: String) {
        let alertView = UIAlertView(title: Title, message: Message, delegate: nil, cancelButtonTitle: "OK", otherButtonTitles: "")
        alertView.show()
    }
    
    class func makeAlertBox(_ message:String , title:String, button1:String, button2:String?, alertTag: Int, delegate: UIAlertViewDelegate?) {
        var messageStr = message
        if !ValidationUtils.isStringValid(messageStr) {
            messageStr = "Oops! Some thing went wrong."
        }
        
        let alert = UIAlertView(title: title, message: messageStr, delegate: delegate, cancelButtonTitle: button1)
        if button2 != nil {
            alert.addButton(withTitle: button2)
        }
        alert.tag = alertTag
        alert.show()
    }
    static func showAlert(title:String?, message:String?, cntrllr:UIViewController){
        
        var alert:UIAlertController
        
        if message != nil {
            alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        } else {
            alert = UIAlertController(title: title, message: "Something went wrong", preferredStyle: UIAlertControllerStyle.alert)
        }
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        cntrllr.present(alert, animated: true, completion: nil)
    }
    
    static func showProgressView(view:UIView, animated:Bool){
        let progressView = ProgressView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        progressView.showProgressView(animated: true)
        progressView.tag = 1000
        view.addSubview(progressView)
    }
    
    static func hideProgressView(view:UIView, animated:Bool){
        let progressView = view.viewWithTag(1000) as? ProgressView
        
        if progressView != nil {
            progressView?.hideProgressView(animated: animated)
            progressView?.removeFromSuperview()
        }
    }

}

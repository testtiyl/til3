//
//  FBWebViewController.swift
//  til2
//
//  Created by Hitesh Kumar on 27/05/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

import UIKit

protocol FBWebViewControllerDelegate:NSObjectProtocol {
    func webview(_ webview: FBWebViewController!, isCancelled:Bool, error: Error?)
}

@objc
enum WebviewType:Int {
    case Login, Share
}

class FBWebViewController: UIViewController, UIWebViewDelegate {
    
    let FBClientId = "287502424977296"

    @IBOutlet var webview: UIWebView!

    @IBOutlet var acitivityIndicator: UIActivityIndicatorView!
    
    weak var delegate:FBWebViewControllerDelegate?
    
    var foundAccessToken = false
    var foundRedirectUri = false
    
    var readPermissions:Array<String>?
    var publishPermissions:Array<String>?
    
    var webviewType:WebviewType = .Login
    
    var shareUrl = ""
    var shareText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupWebview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: Private Methods
    
    private func setupWebview(){
        
        let permissions = getPermissions()
        
        var urlStr = "https://www.facebook.com/dialog/oauth?client_id=\(FBClientId)&display=popup&response_type=token&scope=\(permissions)&redirect_uri=http://tuneinlife.com"
        
        if webviewType == .Share {
            urlStr = "https://www.facebook.com/dialog/share?app_id=\(FBClientId)&display=popup&href=\(shareUrl)&redirect_uri=http://tuneinlife.com&quote=\(shareText)"
        }
        
        urlStr = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let url = URL(string: urlStr)
        
        let request = URLRequest(url: url!)
        
        showAcitivytIndicator(isShow: true)
        
        webview.loadRequest(request)
    }
    
    private func getPermissions() -> String{
        var permissions:String = ""
        
        if readPermissions != nil && (readPermissions?.count)! > 0 {
            permissions = (readPermissions?.joined(separator: ","))!
        }
        
        if publishPermissions != nil && (publishPermissions?.count)! > 0 {
            permissions = permissions + "," + (publishPermissions?.joined(separator: ","))!
        }
        
        if permissions == "" {
            permissions = "public_profile"
        }
        
        return permissions
    }
    
    private func showAcitivytIndicator(isShow:Bool){
        if isShow {
            acitivityIndicator.isHidden = false
            acitivityIndicator.startAnimating()
        }else{
            acitivityIndicator.stopAnimating()
        }
    }

    @IBAction func doneTapped(_ sender: AnyObject) {
        self.dismiss(animated: true) { 
            self.delegate?.webview(self, isCancelled: true, error: nil)
        }
    }
    
    private func checkForAccessToken(url:String)-> Bool{
        let urlComponents = url.components(separatedBy: "?")
        
        if urlComponents.count > 0 && urlComponents[0].contains("http://blog.TIL.in"){
            
            let urlHashComponents = url.components(separatedBy: "#")
            if urlHashComponents.count>1 {
                let hashURlComponents = urlHashComponents[1].components(separatedBy: "&")
                
                if hashURlComponents.count>0 {
                    let accessTokenComponents = hashURlComponents[0].components(separatedBy: "=")
                    
                    if accessTokenComponents.count==2 && accessTokenComponents[0] == "access_token"{
                        
                        let token = accessTokenComponents[1]
                        
                        FBLoginManager.shared.accessToken = token
                        FBLoginManager.shared.saveToken()
                        
                        return true
                    }
                }
            }
        }
        
        return false
    }
    
    private func checkForRedirectUri(url:String)-> Bool{
        let urlComponents = url.components(separatedBy: "?")
        
        if urlComponents.count > 0 && urlComponents[0].contains("http://blog.TIL.in"){
            return true
        }
        
        
        return false
    }
    
    
    //MARK: UIWebview Delegate
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        showAcitivytIndicator(isShow: false)
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        showAcitivytIndicator(isShow: false)

        if webviewType == .Login {
            if !foundAccessToken {
                delegate?.webview(self, isCancelled: false, error: error)
            }
        }else{
            if !foundRedirectUri {
                delegate?.webview(self, isCancelled: false, error: error)
            }
        }
        
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        var canLoadUrl = true
        
        if webviewType == .Login {
            let foundToken = checkForAccessToken(url: (request.url?.absoluteString)!)
            print("fountToken: \(foundToken)")
            if foundToken {
                foundAccessToken = true
                self.dismiss(animated: true) {
                    self.delegate?.webview(self, isCancelled: false, error: nil)
                }
            }
            
            canLoadUrl = !foundToken
        }else{
            let foundRedirectUrl = checkForRedirectUri(url: (request.url?.absoluteString)!)
            if foundRedirectUrl {
                self.foundRedirectUri = true
                self.dismiss(animated: true) {
                    self.delegate?.webview(self, isCancelled: false, error: nil)
                }
            }
            
            canLoadUrl = !foundRedirectUrl
        }
        
        return canLoadUrl
    }
}

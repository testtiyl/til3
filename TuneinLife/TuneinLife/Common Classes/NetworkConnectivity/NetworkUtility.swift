//
//  NetworkUtility.swift
//  CrownIt
//
//  Created by hitesh on 16/09/16.
//  Copyright © 2016 GoldVIP Technology Solutions Private Limited. All rights reserved.
//

import UIKit
import SystemConfiguration

class NetworkUtility: NSObject {
    
    static let sharedInstance = NetworkUtility()
    
    static var isNetworkAvailable = true
    
    let reachability = Reachability()!
    
    override init() {
        super.init()
        
        initializeNetworkUtility()
    }
    
    static func getSharedInstance() -> NetworkUtility {
        return sharedInstance
    }
    
    func initializeNetworkUtility() {

//        NotificationCenter.default.addObserver(self, selector: #selector(NetworkUtility.reachabilityChanged(_:)), name: NSNotification.Name(rawValue: ReachabilityChangedNotification), object: reachability)

        NotificationCenter.default.addObserver(self, selector: #selector(NetworkUtility.reachabilityChanged(_:)),name: ReachabilityChangedNotification,object: reachability)

        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
        
        reachability.whenReachable = { reachability in
            // this is called on a background thread, but UI updates must
            // be on the main thread, like this:
            DispatchQueue.main.async {
                NetworkUtility.isNetworkAvailable = true
                if reachability.isReachableViaWiFi {
                    print("Reachable via WiFi")
                } else {
                    print("Reachable via Cellular")
                }
            }
        }
        reachability.whenUnreachable = { reachability in
            // this is called on a background thread, but UI updates must
            // be on the main thread, like this:
            DispatchQueue.main.async {
                print("Not reachable")
            }
        }
    }
    
    deinit {
        reachability.stopNotifier()
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "ReachabilityChangedNotification"), object: nil)
        NotificationCenter.default.removeObserver(self, name: ReachabilityChangedNotification, object: reachability)
    }
    
    func reachabilityChanged(_ note: NSNotification) {
        
        let reachability = note.object as! Reachability
        
        if reachability.isReachable {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "NoInternetViewHide"), object:nil)
            NetworkUtility.isNetworkAvailable = true

        } else {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "NoInternetViewShow"), object:nil)
            NetworkUtility.isNetworkAvailable = false
        }
    }
}

//
//  AppDelegate.swift
//  CapsForSale
//
//  Created by Fabian Canas on 8/28/15.
//  Copyright (c) 2015 Fabian Canas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Hat.registerSubclass()
        
        Parse.setApplicationId(PARSE_APPLICATION_ID, clientKey: PARSE_CLIENT_KEY)
        return true
    }
    
}


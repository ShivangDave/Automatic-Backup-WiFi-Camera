//
//  AppDelegate.swift
//  Automatic Backup WiFi Camera
//
//  Created by Shivang Dave on 7/4/18.
//  Copyright © 2018 Shivang Dave. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let defaults = UserDefaults.standard
    var token : String?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        token = defaults.object(forKey:"token") as? String
        
        if token != nil
        {
            print(token ?? "")
            let vc = mainStoryboard.instantiateViewController(withIdentifier: "navigationController")
            self.window?.rootViewController = vc
        }
        else
        {
            UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]){ (granted, error) in }
            application.registerForRemoteNotifications()
        }
        
        return true
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data)
    {
        token = deviceToken.hexString
        defaults.set(token, forKey: "token")
        print(token!)
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)
    {
        let aps = userInfo["aps"] as! [String : AnyObject]
        print(aps)
    }
    
    func applicationWillResignActive(_ application: UIApplication)
    {
        
    }

    func applicationDidEnterBackground(_ application: UIApplication)
    {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication)
    {
        
    }

    func applicationDidBecomeActive(_ application: UIApplication)
    {
        
    }

    func applicationWillTerminate(_ application: UIApplication)
    {
        
    }
}


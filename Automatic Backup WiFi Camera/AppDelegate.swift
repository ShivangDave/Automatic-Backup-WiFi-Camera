//
//  AppDelegate.swift
//  Automatic Backup WiFi Camera
//
//  Created by Shivang Dave on 7/4/18.
//  Copyright © 2018 Shivang Dave. All rights reserved.
//

import UIKit
import UserNotifications

var lastNote : [String : AnyObject]?
var nLaunch = false

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let defaults = UserDefaults.standard
    var token : String?
    var orientationLock = UIInterfaceOrientationMask.all

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        token = defaults.object(forKey:"token") as? String
        UIApplication.shared.applicationIconBadgeNumber = 0
        
        if launchOptions?[UIApplication.LaunchOptionsKey.remoteNotification] != nil
        {
            if let remoteNotification = launchOptions?[.remoteNotification] as?  [AnyHashable : Any]
            {
                lastNote = remoteNotification["aps"] as? [String:AnyObject]
                let vc = mainStoryboard.instantiateViewController(withIdentifier: "navigationController")
                self.window?.rootViewController = vc
                nLaunch = true
            }

        }
        else
        {
            if token != nil
            {
                nLaunch = false
                print(token ?? "")
                let vc = mainStoryboard.instantiateViewController(withIdentifier: "navigationController")
                self.window?.rootViewController = vc
            }
            else
            {
                nLaunch = false
                UNUserNotificationCenter.current().requestAuthorization(options:[.badge, .alert, .sound]){ (granted, error) in }
                application.registerForRemoteNotifications()
            }
        }
        
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask
    {
        return self.orientationLock
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
        if let cat = aps["category"] as? Int
        {
            switch cat
            {
                case 0:
                    NotificationCenter.default.post(name: .startStream, object: nil)
                    break
                case 1:
                    NotificationCenter.default.post(name: .stopStream, object: nil)
                    break
                default:
                    break
            }
        }
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


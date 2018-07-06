//
//  HomeVC.swift
//  Automatic Backup WiFi Camera
//
//  Created by Shivang Dave on 7/6/18.
//  Copyright © 2018 Shivang Dave. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialBottomNavigation

class HomeVC: UIViewController, MDCBottomNavigationBarDelegate
{
    @IBOutlet weak var navBar : tabbar!
    @IBOutlet weak var videoButton : roundButtonHome!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        navBar.delegate = self
        changeBar("HOME")
    }
    
    enum someTip {
        case button(UIView,UIColor,String,String)
        case tabbar(UIView,UIColor,String,String)
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        showTips(videoButton, Theme.accentColor, "Just how you want it", "Tap the menu button to switch accounts, change settings & more.")
    }
    
    @IBAction func cameraClicked(_ sender : Any)
    {
        showTips(sender as! roundButtonHome, Theme.accentColor, "Just how you want it", "Tap the menu button to switch accounts, change settings & more.")
    }
    
    func bottomNavigationBar(_ bottomNavigationBar: MDCBottomNavigationBar, didSelect item: UITabBarItem)
    {
        switch item.tag
        {
        case 0:
            showTips(navBar, Theme.accentColor, "Just how you want it", "Tap the menu button to switch accounts, change settings & more.")
            
        case 1:
            showTips(navBar, Theme.accentColor, "Just how you want it", "Tap the menu button to switch accounts, change settings & more.")
        case 2:
            
            showTips(navBar, Theme.accentColor, "Just how you want it", "Tap the menu button to switch accounts, change settings & more.")
            
        default:
            break
        }
    }
    
}

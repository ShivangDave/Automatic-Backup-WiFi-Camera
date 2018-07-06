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

    override func viewDidLoad()
    {
        super.viewDidLoad()
        navBar.delegate = self
        changeBar("HOME")
    }
    
    @IBAction func cameraClicked(_ sender : Any)
    {
        showTips(sender as! roundButtonHome, accentColor, "Just how you want it", "Tap the menu button to switch accounts, change settings & more.")
    }
    
    func bottomNavigationBar(_ bottomNavigationBar: MDCBottomNavigationBar, didSelect item: UITabBarItem)
    {
        switch item.tag
        {
        case 0:
            showTips(navBar, accentColor, "Just how you want it", "Tap the menu button to switch accounts, change settings & more.")
            
        case 1:
            showTips(navBar, accentColor, "Just how you want it", "Tap the menu button to switch accounts, change settings & more.")
        case 2:
            
            showTips(navBar, accentColor, "Just how you want it", "Tap the menu button to switch accounts, change settings & more.")
            
        default:
            break
        }
    }
    
}

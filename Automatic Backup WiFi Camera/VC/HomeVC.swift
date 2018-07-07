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
    
    override func viewDidAppear(_ animated: Bool)
    {
        showTips(videoButton, navBar,Theme.accentColor, "Just how you want it", "Tap the menu button to switch accounts, change settings & more.")
    }
    
    @IBAction func cameraClicked(_ sender : Any)
    {
        if self.currentSSIDs().first == "Automatic Backup WiFi Camera"
        {
            pushIt("StreamVC")
        }
    }
    
    func bottomNavigationBar(_ bottomNavigationBar: MDCBottomNavigationBar, didSelect item: UITabBarItem)
    {
        switch item.tag
        {
        case 0:
            //showTips(navBar, Theme.accentColor, "Just how you want it", "Tap the menu button to switch accounts, change settings & more.")
            break
            
        case 1:
            //showTips(navBar, Theme.accentColor, "Just how you want it", "Tap the menu button to switch accounts, change settings & more.")
            break
        case 2:
            
            //showTips(navBar, Theme.accentColor, "Just how you want it", "Tap the menu button to switch accounts, change settings & more.")
            break
        default:
            break
        }
    }
    
}

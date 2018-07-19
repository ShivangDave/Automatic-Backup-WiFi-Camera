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
    @IBOutlet weak var containerView : UIView!
    
    var currentVC : UIViewController?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        navBar.delegate = self
        changeBar("HOME")
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        currentVC = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewVC")
        setVC(currentVC!,0)
        
        if let noti = lastNote
        {
            let cat = noti["category"] as! Int
            showSnack("\(cat)")
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        self.navigationItem.backBarButtonItem?.tintColor = .white
        //showTips(videoButton, navBar,Theme.accentColor, "Just how you want it", "Tap the menu button to switch accounts, change settings & more.")
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
            setVC(mainStoryboard.instantiateViewController(withIdentifier: "HomeViewVC"),1)
            break
            
        case 1:
            setVC(mainStoryboard.instantiateViewController(withIdentifier: "SettingsVC"),1)
            
            break
        case 2:
            showTips(videoButton, navBar, Theme.accentColor, "Just how you want it", "Tap the menu button to switch accounts, change settings & more.")
            break
        default:
            break
        }
    }
    
    func setVC(_ vc : UIViewController, _ run : Int)
    {
        switch run
        {
            case 0:
                currentVC = vc
                self.addChild(vc)
                setViewSize(vc)
                break
            case 1:
                if currentVC!.restorationIdentifier != vc.restorationIdentifier
                {
                    removeVC(currentVC!)
                    currentVC = vc
                    self.addChild(vc)
                    setViewSize(vc)
                }
                break
            default:
                break
        }
    }
    
    func setViewSize(_ vc: UIViewController)
    {
        containerView.addSubview(vc.view)
        vc.view.frame = containerView.bounds
        vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        vc.didMove(toParent: self)
    }
    
    func removeVC(_ vc : UIViewController)
    {
        vc.willMove(toParent: nil)
        vc.view.removeFromSuperview()
        vc.removeFromParent()
    }
}

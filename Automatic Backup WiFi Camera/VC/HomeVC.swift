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
    
    @objc func startStream(_ notification:Notification)
    {
        showAlert()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationItem.backBarButtonItem?.tintColor = .white
        
        currentVC = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewVC")
        setVC(currentVC!,0)
        NotificationCenter.default.addObserver(self, selector: #selector(startStream(_:)), name: .startStream, object: nil)
        
        if nLaunch
        {
            streamSetup()
        }
        
    }
    
    func streamSetup()
    {
        if let noti = lastNote
        {
            let cat = noti["category"] as! Int
            
            switch cat
            {
                case 0:
                    //showAlert()
                    let vc = mainStoryboard.instantiateViewController(withIdentifier: "StreamVC") as! StreamVC
                    self.navigationController?.pushViewController(vc, animated: true)
                    break
                case 1:
                    showSnack("No active stream found!")
                    break
                default:
                    break
            }
        }
    }
    
    func showAlert()
    {
        let alert = UIAlertController(title: "Confirm", message: "Do you want to start the video?", preferredStyle: .alert)
        let yes = UIAlertAction(title: "Yes", style: .default) { (action) in
            let vc = mainStoryboard.instantiateViewController(withIdentifier: "StreamVC") as! StreamVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        let no = UIAlertAction(title: "No", style: .cancel) { (action) in
            alert.dismiss(animated: true, completion: {
                self.showSnack("Stream cancelled!")
            })
        }
        alert.addAction(yes)
        alert.addAction(no)
        self.present(alert, animated: true, completion: nil)
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
            changeBar("HOME")
            break
            
        case 1:
            setVC(mainStoryboard.instantiateViewController(withIdentifier: "SettingsVC"),1)
            changeBar("SETTINGS")
            break
        case 2:
            showTips(navBar, videoButton, Theme.accentColor, "MENU OPTIONS", "Tap on the menu buttons to switch between Home, Settings & Tips.", "VIDEO FEED", "Tap on this button to trigger video feed manually.")
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

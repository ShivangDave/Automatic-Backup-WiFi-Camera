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
    //MARK:- Outlets
    @IBOutlet weak var navBar : tabbar!
    @IBOutlet weak var videoButton : roundButtonHome!
    @IBOutlet weak var containerView : UIView!
    
    var currentVC : UIViewController?

    //MARK:- UIView methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navBar.delegate = self
        changeBar("HOME")
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        AppUtility.lockOrientation(.all, andRotateTo: .portrait)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        setupView()
        showSnack("No active stream found!")
        addTestProp()
    }
    
    func setupView()
    {
        self.navigationItem.backBarButtonItem?.tintColor = .white
        currentVC = mainStoryboard.instantiateViewController(withIdentifier: "HomeViewVC")
        setVC(currentVC!,0)
    }
    
    func addTestProp()
    {
        self.videoButton.isAccessibilityElement = true
        self.videoButton.accessibilityLabel = "btn3"
    }
    
    
    //MARK:- Launch camera stream manually
    @IBAction func cameraClicked(_ sender : Any)
    {
        pushIt("StreamVC")
    }
    
    //MARK:- Tabbar delegate
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
    
    //MARK:- Add / remove child VC from container view
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
    
    //MARK:- set view size inside container view
    func setViewSize(_ vc: UIViewController)
    {
        containerView.addSubview(vc.view)
        vc.view.frame = containerView.bounds
        vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        vc.didMove(toParent: self)
    }
    
    //MARK:- navigate through VC on option selection
    func removeVC(_ vc : UIViewController)
    {
        vc.willMove(toParent: nil)
        vc.view.removeFromSuperview()
        vc.removeFromParent()
    }
}

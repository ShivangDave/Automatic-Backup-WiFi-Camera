//
//  ConnectWiFiVC.swift
//  Automatic Backup WiFi Camera
//
//  Created by Shivang Dave on 7/5/18.
//  Copyright © 2018 Shivang Dave. All rights reserved.
//

import UIKit
import AnimatedScrollView
import NetworkExtension
import MaterialComponents.MaterialMaskedTransition

class ConnectWiFiVC: UIViewController
{
    @IBOutlet weak var animatedScroll: AnimatedScrollView!
    @IBOutlet weak var cardBackView : cardView!
    @IBOutlet weak var cardView : cardView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func btnSuccessClicked(_ sender: Any)
    {
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "navigationController1")
        let transitionController = MDCMaskedTransitionController(sourceView: sender as! roundButtonHome)
        
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = transitionController
        
        present(vc, animated: true)
    }
    
    func connectWifi()
    {
        #if !arch(i386) && !arch(x86_64)
        let config = NEHotspotConfiguration(ssid: "Automatic Backup WiFi Camera", passphrase: "ChangeMe", isWEP: false)
        
        NEHotspotConfigurationManager.shared.apply(config) { (error) in
            if error != nil {
                if error?.localizedDescription == "already associated."
                {
                    
                }
                else
                {
                
                }
            }
            
        }
        #endif
    }
    
    @objc func nextVC(_ sender: Any)
    {
        //connectWifi()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        animatedScroll.animate(self.view, imageName: "background", animated: true)
        animatedScroll.alpha = 0.3
        cardView.addTarget(self, action: #selector(nextVC(_:)), for: .touchUpInside)
        changeBar("CONNECT TO WiFi")
    }
}

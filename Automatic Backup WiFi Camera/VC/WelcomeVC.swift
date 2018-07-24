//
//  ViewController.swift
//  Automatic Backup WiFi Camera
//
//  Created by Shivang Dave on 7/4/18.
//  Copyright © 2018 Shivang Dave. All rights reserved.
//

import UIKit
import AnimatedScrollView
import MaterialComponents.MaterialMaskedTransition

class WelcomeVC: UIViewController
{
    @IBOutlet weak var animatedScroll: AnimatedScrollView!
    @IBOutlet weak var cardBackView : cardView!
    @IBOutlet weak var cardView : cardView!
    
    @IBOutlet weak var btnSuccess : roundButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func btnSuccessClicked(_ sender: Any)
    {
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "navigationController0")
        let transitionController = MDCMaskedTransitionController(sourceView: btnSuccess)
        
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = transitionController
        
        present(vc, animated: true)
        
    }
    
    @objc func nextVC(_ sender: Any)
    {
        //pushIt("ConnectWiFiVC")
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        AppUtility.lockOrientation(.portrait)
        animatedScroll.animate(self.view, imageName: "background", animated: true)
        animatedScroll.alpha = 0.3
        cardView.addTarget(self, action: #selector(nextVC(_:)), for: .touchUpInside)
    }
}


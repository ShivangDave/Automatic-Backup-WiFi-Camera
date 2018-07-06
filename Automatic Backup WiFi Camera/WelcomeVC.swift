//
//  ViewController.swift
//  Automatic Backup WiFi Camera
//
//  Created by Shivang Dave on 7/4/18.
//  Copyright © 2018 Shivang Dave. All rights reserved.
//

import UIKit
import AnimatedScrollView
import MaterialComponents.MaterialAppBar

class WelcomeVC: UIViewController
{
    @IBOutlet weak var animatedScroll: AnimatedScrollView!
    @IBOutlet weak var cardBackView : cardView!
    @IBOutlet weak var cardView : cardView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    
    @objc func nextVC(_ sender: Any)
    {
        print("Works!!!")
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        animatedScroll.animate(self.view, imageName: "background", animated: true)
        animatedScroll.alpha = 0.3
        cardView.addTarget(self, action: #selector(nextVC(_:)), for: .touchUpInside)
    }
}


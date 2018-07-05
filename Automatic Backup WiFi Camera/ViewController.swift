//
//  ViewController.swift
//  Automatic Backup WiFi Camera
//
//  Created by Shivang Dave on 7/4/18.
//  Copyright © 2018 Shivang Dave. All rights reserved.
//

import UIKit
import AnimatedScrollView

class ViewController: UIViewController
{
    @IBOutlet weak var animatedScroll: AnimatedScrollView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        animatedScroll.animate(self.view, imageName: "background", animated: true)
        
    }


}


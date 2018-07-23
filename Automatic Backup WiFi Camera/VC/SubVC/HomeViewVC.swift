//
//  HomeViewVC.swift
//  Automatic Backup WiFi Camera
//
//  Created by Shivang Dave on 7/13/18.
//  Copyright © 2018 Shivang Dave. All rights reserved.
//

import UIKit
import AnimatedScrollView

class HomeViewVC: UIViewController
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
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        animatedScroll.animate(self.view, imageName: "background", animated: true)
        animatedScroll.alpha = 0.3
        cardView.addTarget(self, action: #selector(nextVC(_:)), for: .touchUpInside)
    }

}

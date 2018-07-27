//
//  ConnectWiFiVC.swift
//  Automatic Backup WiFi Camera
//
//  Created by Shivang Dave on 7/5/18.
//  Copyright © 2018 Shivang Dave. All rights reserved.
//

import UIKit
import AnimatedScrollView
import MaterialComponents.MaterialMaskedTransition

class ConnectWiFiVC: UIViewController
{
    //MARK:- Outlets
    @IBOutlet weak var animatedScroll: AnimatedScrollView!
    @IBOutlet weak var cardBackView : cardView!
    @IBOutlet weak var cardView : cardView!
    @IBOutlet weak var btnNext: roundButtonHome!
    @IBOutlet weak var bottomConst: NSLayoutConstraint!
    @IBOutlet weak var lblItalic: italicLabel!
    
    var registered = false
    
    //MARK:- UIView methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        AppUtility.lockOrientation(.portrait)
        prepareView()
        addTestProp()
        
        btnNext.isHidden = true
        self.bottomConst.priority = UILayoutPriority.init(1.0)
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        showButton()
    }
    
    func prepareView()
    {
        animatedScroll.animate(self.view, imageName: "background", animated: true)
        animatedScroll.alpha = 0.3
        cardView.addTarget(self, action: #selector(nextVC(_:)), for: .touchUpInside)
        changeBar("CONNECT TO WiFi")
    }
    
    func addTestProp()
    {
        self.btnNext.isAccessibilityElement = true
        self.btnNext.accessibilityLabel = "btn1"
    }
    
    //MARK:- Move to the next VC
    @IBAction func btnSuccessClicked(_ sender: Any)
    {
        let vc = mainStoryboard.instantiateViewController(withIdentifier: "navigationController1")
        let transitionController = MDCMaskedTransitionController(sourceView: sender as! roundButtonHome)
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = transitionController
        present(vc, animated: true)
    }
    
    //MARK:- CardView method / Retry connection if not connected.
    @objc func nextVC(_ sender: Any)
    {
    }
    
    //MARK:- Button animation constraint changes
    func buttonAnimation()
    {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false)
        { (_) in
            UIView.transition(with: self.btnNext, duration: 2, options: .transitionCrossDissolve, animations: {
                self.bottomConst.priority = UILayoutPriority.init(999.0)
                self.view.layoutIfNeeded()
                self.btnNext.isHidden = false
                self.lblItalic.text = "Tap next to continue."
            })
        }
    }
    
    //MARK:- Hide/Unhide button with animation
    func showButton()
    {
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { (_) in
            self.buttonAnimation()
        }
    }
}

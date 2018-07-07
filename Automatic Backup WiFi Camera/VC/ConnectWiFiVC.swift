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
import Alamofire
import MaterialComponents.MaterialMaskedTransition

class ConnectWiFiVC: UIViewController
{
    @IBOutlet weak var animatedScroll: AnimatedScrollView!
    @IBOutlet weak var cardBackView : cardView!
    @IBOutlet weak var cardView : cardView!
    
    @IBOutlet weak var btnNext: roundButtonHome!
    @IBOutlet weak var bottomConst: NSLayoutConstraint!
    @IBOutlet weak var lblItalic: italicLabel!
    
    var connect = false
    
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
    
    func connectWifi()->Bool
    {
        let ssid = "Automatic Backup WiFi Camera"
        let password = "ChangeMe"
        
//        let ssid = "Get your own WiFi"
//        let password = "follow1969coast"
        
        #if !arch(i386) && !arch(x86_64)
        let config = NEHotspotConfiguration(ssid: ssid, passphrase: password, isWEP: false)
        
        startAnimating(activityIndicator)
        
        NEHotspotConfigurationManager.shared.apply(config) { (error) in
            if error != nil
            {
                let desc = error?.localizedDescription.capitalized
                self.showSnack(desc ?? "")
                if desc == "Already Associated."
                {
                    self.connect = true
                    self.showButton()
                }
                else
                {
                    self.connect = false
                }
                
                self.stopAnimating(activityIndicator)
            }
            else
            {
                if self.currentSSIDs().first == ssid
                {
                    self.showSnack("Success")
                    self.connect = true
                    self.showButton()
                }
                else
                {
                    self.showSnack("Couldn't find WiFi Network")
                    self.connect = false
                }
                self.stopAnimating(activityIndicator)
            }
            
        }
        #endif
        return self.connect
    }
    
    @objc func nextVC(_ sender: Any)
    {
        if !connect
        {
            _ = connectWifi()
        }
        else
        {
            cardView.isUserInteractionEnabled = false
            lblItalic.text = "Tap next to continue."
            showSnack("Tap next to continue.")
        }
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        _ = connectWifi()
    }
    
    
    func showButton()
    {
        if !connect
        {
            self.btnNext.isHidden = true
            self.bottomConst.priority = UILayoutPriority.defaultLow
        }
        else
        {
            //sendReq()
            Timer.scheduledTimer(withTimeInterval: 4.0, repeats: false) { (_) in
                self.sendReq()
            }
        }
    }
    
    func sendReq()
    {
        let data = ["token":appDelegate.token!]
        
        Alamofire.request("http://10.3.141.1:3000/connect", method: .post, parameters: data, encoding: JSONEncoding.default, headers: nil).responseJSON(queue: DispatchQueue.main, options: []) { (res) in
            switch res.result
            {
                case .success(let json):
                    let dic = json as! NSDictionary
                    let code = dic.value(forKey: "response") as! String
                    print(code)
                    UIView.transition(with: self.btnNext, duration: 3, options: .transitionCrossDissolve, animations: {
                        self.btnNext.isHidden = false
                        self.bottomConst.priority = UILayoutPriority.defaultHigh
                        self.lblItalic.text = "Tap next to continue."
                    })
                
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func manageToken(_ flag: Bool)->Bool
    {
        var temp = false
        if flag
        {
            temp = true
        }
        return temp
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        animatedScroll.animate(self.view, imageName: "background", animated: true)
        animatedScroll.alpha = 0.3
        cardView.addTarget(self, action: #selector(nextVC(_:)), for: .touchUpInside)
        changeBar("CONNECT TO WiFi")
        showButton()
    }
}

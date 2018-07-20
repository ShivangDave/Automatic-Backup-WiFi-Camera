//
//  Constant.swift
//  Automatic Backup WiFi Camera
//
//  Created by Shivang Dave on 7/4/18.
//  Copyright © 2018 Shivang Dave. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents
import Alamofire
import SystemConfiguration.CaptiveNetwork

let activityIndicator = MDCActivityIndicator()
let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
let appDelegate = UIApplication.shared.delegate as! AppDelegate
var flag = true

extension Notification.Name
{
    static let startStream = Notification.Name("startStream")
    static let stopStream = Notification.Name("stopStream")
}

extension UIView
{
    func rotate(duration: CFTimeInterval=1.0, completionDelegate: AnyObject? = nil)
    {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat.pi / 4.0
        rotateAnimation.duration = duration
        if let delegate: AnyObject = completionDelegate
        {
            rotateAnimation.delegate = delegate as? CAAnimationDelegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
}

extension UIViewController
{
    func currentSSIDs() -> [String]
    {
        guard let interfaceNames = CNCopySupportedInterfaces() as? [String] else {
            return []
        }
        return interfaceNames.compactMap { name in
            guard let info = CNCopyCurrentNetworkInfo(name as CFString) as? [String:AnyObject] else {
                return nil
            }
            guard let ssid = info[kCNNetworkInfoKeySSID as String] as? String else {
                return nil
            }
            return ssid
        }
    }
    
    func showTips(_ view: UIView, _ view2: UIView,_ color: UIColor,_ title: String,_ tip: String,_ title2: String,_ tip2:String)
    {
        let highlightController = MDCFeatureHighlightViewController(highlightedView: view) { (_) in
            if flag
            {
                self.showTips(view2, view, color, title2, tip2, title, tip)
            }
            flag = false
        }
        highlightController.titleColor = UIColor.white
        highlightController.bodyColor = UIColor.white
        highlightController.titleFont = Theme.primaryFont
        highlightController.bodyFont = Theme.smallFont
        highlightController.titleText = title
        highlightController.bodyText = tip
        highlightController.outerHighlightColor =
        color
        present(highlightController, animated: true, completion:nil)
    }
    
    func changeBar(_ title: String)
    {
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = title
    }
    
    func showSnackButton(_ message: String, _ buttonTitle:String)
    {
        let message = MDCSnackbarMessage(text: message)
        
        let action = MDCSnackbarMessageAction()
        let handler = {() in
            let answereMessage = MDCSnackbarMessage(text: "Done")
            MDCSnackbarManager.show(answereMessage)
        }
        action.handler = handler
        action.title = buttonTitle
        message.action = action
        MDCSnackbarManager.show(message)
    }
    
    func showSnack(_ message: String)
    {
        let message = MDCSnackbarMessage(text: message)
        MDCSnackbarManager.show(message)
    }
    
    func pushIt(_ vc: String)
    {
        let dvc = mainStoryboard.instantiateViewController(withIdentifier: vc)
        UIView.animate(withDuration: 3.0) {
            _ = self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
    
    func presentIt(_ vc : String)
    {
        let dvc = mainStoryboard.instantiateViewController(withIdentifier: vc)
        dvc.modalPresentationStyle = .custom
        dvc.modalTransitionStyle = .crossDissolve
        present(dvc, animated: true, completion: nil)
    }
    
    func startAnimating(_ activityIndicator: MDCActivityIndicator)
    {
        let overlay = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        overlay.tag = 1
        overlay.backgroundColor = UIColor.white
        overlay.alpha = 0.8
        view.addSubview(overlay)
        
        activityIndicator.tag = 2
        activityIndicator.radius = 25.0
        activityIndicator.indicatorMode = .indeterminate
        activityIndicator.center.x = overlay.center.x
        activityIndicator.center.y = overlay.center.y-70.0
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
    }
    
    func stopAnimating(_ activityIndicator: MDCActivityIndicator)
    {
        self.view.viewWithTag(1)?.removeFromSuperview()
        self.view.viewWithTag(2)?.removeFromSuperview()
        activityIndicator.stopAnimating()
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension Data
{
    var hexString: String
    {
        let hexString = map { String(format: "%02.2hhx", $0) }.joined()
        return hexString
    }
}

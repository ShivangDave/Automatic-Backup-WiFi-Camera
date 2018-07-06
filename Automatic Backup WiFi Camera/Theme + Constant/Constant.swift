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

let activityIndicator = MDCActivityIndicator()
let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
let appDelegate = UIApplication.shared.delegate as! AppDelegate
var flag = true

extension UIViewController
{
    func showTips(_ view: UIView, _ view2: UIView,_ color: UIColor,_ title: String,_ tip: String)
    {
        let highlightController = MDCFeatureHighlightViewController(highlightedView: view) { (_) in
            if flag
            {
                self.showTips(view2, view, color, title, tip)
            }
            flag = false
        }
        highlightController.titleColor = UIColor.white
        highlightController.bodyColor = UIColor.white
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
    
    func showSnack(_ message: String, _ buttonTitle:String)
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
    
    func pushIt(_ vc: String)
    {
        let dvc = mainStoryboard.instantiateViewController(withIdentifier: vc)
        UIView.animate(withDuration: 3.0) {
            _ = self.navigationController?.pushViewController(dvc, animated: true)
        }

//        let transition = CATransition()
//        let materialCurve = MDCAnimationTimingFunction.deceleration
//        let timingFunction = CAMediaTimingFunction.mdc_function(withType: materialCurve)
//
//        transition.duration = 3.0
//
//        transition.timingFunction = timingFunction
//        transition.type = CATransitionType.push
//        self.navigationController?.view.layer.add(transition, forKey: nil)
        
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
        activityIndicator.sizeToFit()
        activityIndicator.indicatorMode = .indeterminate
        activityIndicator.center = self.view.center
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
    }
    
    func stopAnimating(_ activityIndicator: MDCActivityIndicator)
    {
        activityIndicator.stopAnimating()
    }
    
    func sendReq(_ data:Parameters,_ url:String)->(String,Bool)
    {
        var response = ""
        var success = false
        
        Alamofire.request(url, method: .post, parameters: data, encoding: JSONEncoding.default).responseJSON{(res) in
            switch res.result
            {
            case .success(let json):
                let dic = json as! NSDictionary
                let code = dic.value(forKey: "response") as! String
                response = code
                success = true
                //print(code)
                //self.showAlert("Response",code)
                
                
            case .failure(let error):
                response = error.localizedDescription
                success = false
                //print(error.localizedDescription)
                //self.showAlert("Response",error.localizedDescription)
            }
        }
        return (response,success)
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

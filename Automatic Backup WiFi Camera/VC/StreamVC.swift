//
//  TempVC.swift
//  Automatic Backup WiFi Camera
//
//  Created by Shivang Dave on 7/7/18.
//  Copyright © 2018 Shivang Dave. All rights reserved.
//

import UIKit

class StreamVC: UIViewController {

    @IBOutlet weak var imgView : UIImageView!
    @IBOutlet weak var alertView : UIView!
    @IBOutlet weak var alertLabel : UILabel!
    
    let url = NSURL(string: "http://10.3.141.1:3000/start")
    var streamingController : MjpegStreamingController?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        streamingController = MjpegStreamingController(imageView: imgView)
        streamingController!.play(url: url! as URL)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        alertLabel.font = Theme.primaryFont
        alertLabel.textColor = Theme.primaryColor
        alertLabel.lineBreakMode = .byWordWrapping
        alertLabel.numberOfLines = 0
        alertLabel.text = "Change the orientation to landscape to continue."
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape
        {
            alertLabel.isHidden = true
            alertView.isHidden = true
        }
        else
        {
            alertLabel.isHidden = false
            alertView.isHidden = false
        }
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        streamingController!.stop()
    }

}

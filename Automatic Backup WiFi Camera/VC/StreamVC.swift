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
    
    let url = NSURL(string: "http://10.3.141.1:3000/start")
    var streamingController : MjpegStreamingController?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        imgView.transform = imgView.transform.rotated(by: -.pi/2)
        streamingController = MjpegStreamingController(imageView: imgView)
        streamingController!.play(url: url! as URL)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape
        {
            imgView.transform = imgView.transform.rotated(by: .pi/2)
        }
        else
        {
            imgView.transform = imgView.transform.rotated(by: -.pi/2)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        streamingController!.stop()
    }

}

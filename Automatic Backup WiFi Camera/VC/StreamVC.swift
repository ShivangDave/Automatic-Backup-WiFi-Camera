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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let streamingController = MjpegStreamingController(imageView: imgView)
        let url = NSURL(string: "http://10.3.141.1:8000/")
        streamingController.play(url: url! as URL)
    }

}

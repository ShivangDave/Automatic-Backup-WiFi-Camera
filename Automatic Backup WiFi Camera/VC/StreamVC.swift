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
    @IBOutlet weak var btnRotate : UIButton!
    
    let url = NSURL(string: API_URL.start)
    var streamingController : MjpegStreamingController?
    var fullScreen = false
    var oldFrame: CGRect?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationItem.title = "STREAM"
        setAlert()
        play(imgView)
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        streamingController!.stop()
    }
    
    @objc func stopStream(_ notification:Notification)
    {
        streamingController!.stop()
        self.navigationController?.popToRootViewController(animated: true)
        nLaunch = false
        self.showSnack("Stream Finished!")
    }
    
    func setAlert()
    {
        if !UIDevice.current.orientation.isLandscape
        {
            btnRotate.isHidden = false
            alertLabel.isHidden = false
            alertView.isHidden = false
            
            alertLabel.font = Theme.smallFont
            alertLabel.textColor = Theme.primaryColor
            alertLabel.lineBreakMode = .byWordWrapping
            alertLabel.numberOfLines = 0
            alertLabel.text = "Switch to landscape mode to continue."
            
            self.btnRotate.isUserInteractionEnabled = false
            self.btnRotate.setBackgroundImage(UIImage(named: "ic_rotation_24_filled"), for: .normal)
            self.btnRotate.tintColor = Theme.accentColor
            self.btnRotate.rotate()
        }
        else
        {
            hideAlert()
        }
    }
    
    func hideAlert()
    {
        alertView.isHidden = true
        alertLabel.isHidden = true
        btnRotate.isHidden = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape
        {
            hideAlert()
        }
        else
        {
            setAlert()
        }
    }
    
    func play(_ imgView : UIImageView)
    {
        NotificationCenter.default.addObserver(self, selector: #selector(stopStream(_:)), name: .stopStream, object: nil)
        streamingController = MjpegStreamingController(imageView: imgView)
        streamingController!.play(url: url! as URL)
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer)
    {
        if !fullScreen
        {
            self.fullScreen = true
            
            let imageView = sender.view as! UIImageView
            oldFrame = imageView.frame
            imageView.frame = UIScreen.main.bounds
            imageView.backgroundColor = .black
            imageView.contentMode = .scaleToFill
            imageView.isUserInteractionEnabled = true
            self.navigationController?.isNavigationBarHidden = true
        }
        else
        {
            self.fullScreen = false
            let imageView = sender.view as! UIImageView
            imageView.frame = oldFrame!
            self.navigationController?.isNavigationBarHidden = false
        }
    }
}

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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func play(_ imgView : UIImageView)
    {
        NotificationCenter.default.addObserver(self, selector: #selector(stopStream(_:)), name: .stopStream, object: nil)
        streamingController = MjpegStreamingController(imageView: imgView)
        streamingController!.play(url: url! as URL)
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        changeBar("STREAM")
        setAlert()
        play(imgView)
    }
    
    @objc func stopStream(_ notification:Notification)
    {
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
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer)
    {
        let imageView = sender.view as! UIImageView
        let newImageView = UIImageView(image: imageView.image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleToFill
        newImageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        newImageView.addGestureRecognizer(tap)
        
        self.view.addSubview(newImageView)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer)
    {
        self.navigationController?.isNavigationBarHidden = false
        sender.view?.removeFromSuperview()
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        streamingController!.stop()
    }

}

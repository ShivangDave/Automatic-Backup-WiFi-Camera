//
//  Theme.swift
//  Automatic Backup WiFi Camera
//
//  Created by Shivang Dave on 7/5/18.
//  Copyright © 2018 Shivang Dave. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents.MaterialCards
import AnimatedScrollView

let primaryColor = UIColor(red: 59.0/255, green: 77.0/255, blue: 159.0/255, alpha: 1.0)
let accentColor = UIColor(red: 226.0/255, green: 46.0/255, blue: 106.0/255, alpha: 1.0)

let primaryFont = UIFont(name: "Rubik-Medium", size: 20.0)!
let primaryFontAlert = UIFont(name: "Rubik-Medium", size: 12.0)!

let smallFont = UIFont(name: "Rubik-Regular", size: 17.0)
let italicFont = UIFont.italicSystemFont(ofSize: 12.0)

class headerLabel : UILabel
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    override func awakeFromNib()
    {
        self.font = primaryFont
        self.textColor = accentColor
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}

class middleLabel : UILabel
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    override func awakeFromNib()
    {
        self.font = smallFont
        self.textColor = accentColor
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}

class italicLabel : UILabel
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    override func awakeFromNib()
    {
        self.font = italicFont
        self.textColor = accentColor
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}

class navBar : UINavigationBar
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    override func awakeFromNib()
    {
        self.barTintColor = primaryColor
        self.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: primaryFont]
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}

class cardView : MDCCard
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    override func awakeFromNib()
    {
        self.cornerRadius = 20.0
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}

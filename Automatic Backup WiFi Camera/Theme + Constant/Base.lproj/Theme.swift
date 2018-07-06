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

//Flip
//let accentColor = UIColor(red: 59.0/255, green: 77.0/255, blue: 159.0/255, alpha: 1.0)
//let primaryColor = UIColor(red: 226.0/255, green: 46.0/255, blue: 106.0/255, alpha: 1.0)


let primaryFont = UIFont(name: "Rubik-Medium", size: 20.0)!
let primaryFontAlert = UIFont(name: "Rubik-Medium", size: 12.0)!

let smallFont = UIFont(name: "Rubik-Regular", size: 17.0)
let buttonFont = UIFont(name: "Rubik-Regular", size: 20.0)
let italicFont = UIFont.italicSystemFont(ofSize: 12.0)

struct Theme
{
    static var primaryColor: UIColor  { return UIColor(red: 59.0/255, green: 77.0/255, blue: 159.0/255, alpha: 1.0) }
    static var accentColor: UIColor  { return UIColor(red: 226.0/255, green: 46.0/255, blue: 106.0/255, alpha: 1.0) }
}

class tabbar : MDCBottomNavigationBar
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    override func awakeFromNib()
    {
        self.titleVisibility = .never
        self.unselectedItemTintColor = primaryColor
        self.selectedItemTintColor = primaryColor
        self.itemTitleFont = primaryFontAlert
        
        let item1 = UITabBarItem(title: "Home", image: UIImage(named: "ic_home_24_filled"), tag: 0)
        let item2 = UITabBarItem(title: "Settings", image: UIImage(named: "ic_settings_24_filled"), tag: 1)
        let item3 = UITabBarItem(title: "About", image: UIImage(named: "ic_about_24_filled"), tag: 2)
        self.items = [item1, item2, item3]
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}

class roundButton : MDCFloatingButton
{
    
    override init(frame: CGRect, shape: MDCFloatingButtonShape) {
        super.init(frame: frame, shape: shape)
    }
    
    override func awakeFromNib()
    {
        self.tintColor = UIColor.white
        self.setBackgroundColor(accentColor)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}

class roundButtonHome : MDCFloatingButton
{
    
    override init(frame: CGRect, shape: MDCFloatingButtonShape) {
        super.init(frame: frame, shape: shape)
    }
    
    override func awakeFromNib()
    {
        self.tintColor = UIColor.white
        self.setBackgroundColor(primaryColor)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}

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

class navigationController : UINavigationController
{
    override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?)
    {
        super.init(navigationBarClass: navBar.self, toolbarClass: toolbarClass)
    }
    
    override func awakeFromNib()
    {
        
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}

class navigationController1 : UINavigationController
{
    override init(navigationBarClass: AnyClass?, toolbarClass: AnyClass?)
    {
        super.init(navigationBarClass: navBarHome.self, toolbarClass: toolbarClass)
    }
    
    override func awakeFromNib()
    {
        
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
}

class navBarHome : UINavigationBar
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    override func awakeFromNib()
    {
        self.barTintColor = accentColor
        self.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: primaryFont]
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

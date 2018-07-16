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
import MaterialComponents.MDCMultilineTextField
import AnimatedScrollView

class floatText: MDCMultilineTextField
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
    }
    
    override func awakeFromNib()
    {
        self.textColor = Theme.accentColor
        self.placeholderLabel.textColor = Theme.primaryColor
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
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
        self.unselectedItemTintColor = Theme.primaryColor
        self.selectedItemTintColor = Theme.primaryColor
        self.itemTitleFont = Theme.primaryFontAlert
        
        self.items = [tabItem.item1, tabItem.item2, tabItem.item3]
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
        self.setBackgroundColor(Theme.accentColor)
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
        self.setBackgroundColor(Theme.primaryColor)
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
        self.font = Theme.primaryFont
        self.textColor = Theme.accentColor
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
        self.font = Theme.smallFont
        self.textColor = Theme.accentColor
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
        self.font = Theme.italicFont
        self.textColor = Theme.accentColor
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
        self.barTintColor = Theme.accentColor
        self.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: Theme.primaryFont]
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
        self.barTintColor = Theme.primaryColor
        self.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: Theme.primaryFont]
        
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

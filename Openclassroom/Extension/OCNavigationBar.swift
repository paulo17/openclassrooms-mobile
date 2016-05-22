//
//  OCNavigationBar.swift
//  Openclassroom
//
//  Created by Paul on 06/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

extension UINavigationBar {
    func OCDefaultNavigationBar() {
        self.translucent = false
        self.shadowImage = UIImage()
        self.tintColor = UIColor.whiteColor()
        self.barStyle = .Default
        
        var bounds = self.bounds
        bounds.size.height += 100
        
        self.setBackgroundImage(CAGradientLayer.createGradient([UIColor.OCDustyOrangeColor().CGColor, UIColor.OCLipstickColor().CGColor], bounds: bounds), forBarMetrics: UIBarMetrics.Default)
        
        if let navBarFont = UIFont(name: "SourceSansPro-Light", size: 16) {
            let navBarAttributesDictionary: [String: AnyObject]?  = [
                NSForegroundColorAttributeName: UIColor.whiteColor(),
                NSFontAttributeName: navBarFont
            ]
            self.titleTextAttributes = navBarAttributesDictionary
        }
    }
    
    func OCInvisibleNavigationBar() {
        self.translucent = true
        self.shadowImage = UIImage()
        self.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.backgroundColor = UIColor.clearColor()
        self.tintColor = UIColor.whiteColor()
    }
}

//
//  OCExpandNavigationController.swift
//  Openclassroom
//
//  Created by cordi on 22/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class OCExpandNavigationController: UINavigationController {
    
    let colorMain = try! UIColor(rgba_throws: "#F39539")
    let colorSecondary = try! UIColor(rgba_throws: "#C21945")
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.frame.origin.y = 40
        setNavigationBarUI()
    }
    
    
    // MARK: - Functions
    func setNavigationBarUI() {
        self.navigationBar.translucent = false
        self.navigationBar.barStyle = .Default
        self.navigationBar.tintColor = UIColor.whiteColor()
        
        let fontDictionary = [ NSForegroundColorAttributeName:UIColor.whiteColor() ]
        
        self.navigationBar.titleTextAttributes = fontDictionary
        
        var bounds = self.navigationBar.bounds
        bounds.size.height += 100
        
        let colorGradientLeft = colorMain
        let colorGradientRight = colorSecondary
        
        self.navigationBar.setBackgroundImage(CAGradientLayer.createGradient([colorGradientLeft.CGColor, colorGradientRight.CGColor], bounds: bounds), forBarMetrics: UIBarMetrics.Default)
    }
}

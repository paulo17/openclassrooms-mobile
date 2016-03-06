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
        self.setBackgroundImage(UIImage(), forBarMetrics:UIBarMetrics.Default)
        self.translucent = true
        self.shadowImage = UIImage()
        self.tintColor = UIColor.whiteColor()
    }
}

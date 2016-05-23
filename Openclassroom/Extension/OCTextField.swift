//
//  OCTextField.swift
//  Openclassroom
//
//  Created by Paul on 05/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import Cartography

extension UITextField {
    
    func OCDefaultTextField(stackView: UIStackView?) {
        let border = CALayer()
        let width = CGFloat(1.0)
        
        let frameWidth = (stackView != nil) ? stackView!.frame.size.width : self.frame.size.width
        
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: frameWidth, height: self.frame.size.height)
        border.borderWidth = width
        border.borderColor = UIColor.OCSilverColor().CGColor
        
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}

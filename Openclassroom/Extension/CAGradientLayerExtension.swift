//
//  CAGradientLayerExtension.swift
//  Openclassroom
//
//  Created by cordi on 22/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    class func createGradient(gradient: [CGColor], bounds: CGRect) -> UIImage {
        let g = CAGradientLayer()
        g.frame = bounds
        g.colors = gradient
        g.startPoint = CGPoint(x: 0.0, y: 0.0)
        g.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        UIGraphicsBeginImageContext(g.bounds.size)
        g.renderInContext(UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
}

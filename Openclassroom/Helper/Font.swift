//
//  Font.swift
//  Openclassroom
//
//  Created by Paul on 02/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

func generateStyleLabel(label: UILabel, font: String, color: String, size: CGFloat, alpha: Float, text: String?) {
    
    label.font = UIFont(name: "\(font)", size: size)
    label.textColor = UIColorFromRGBA("\(color)", alpha: alpha)
    label.text = "\(text)"
    
}

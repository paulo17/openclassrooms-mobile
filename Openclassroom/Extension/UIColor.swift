//
//  UIColor.swift
//  Openclassroom
//
//  Created by Paul on 28/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

extension UIColor {
    
    public convenience init(hex3: UInt16, alpha: CGFloat = 1) {
        let divisor = CGFloat(15)
        let red     = CGFloat((hex3 & 0xF00) >> 8) / divisor
        let green   = CGFloat((hex3 & 0x0F0) >> 4) / divisor
        let blue    = CGFloat( hex3 & 0x00F      ) / divisor
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public convenience init(hex4: UInt16) {
        let divisor = CGFloat(15)
        let red     = CGFloat((hex4 & 0xF000) >> 12) / divisor
        let green   = CGFloat((hex4 & 0x0F00) >>  8) / divisor
        let blue    = CGFloat((hex4 & 0x00F0) >>  4) / divisor
        let alpha   = CGFloat( hex4 & 0x000F       ) / divisor
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public convenience init(hex6: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public convenience init(hex8: UInt32) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex8 & 0xFF000000) >> 24) / divisor
        let green   = CGFloat((hex8 & 0x00FF0000) >> 16) / divisor
        let blue    = CGFloat((hex8 & 0x0000FF00) >>  8) / divisor
        let alpha   = CGFloat( hex8 & 0x000000FF       ) / divisor
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public convenience init(rgba_throws rgba: String) throws {
        guard rgba.hasPrefix("#") else {
            throw Error.MissingHashMarkAsPrefix
        }
        
        guard let hexString: String = rgba.substringFromIndex(rgba.startIndex.advancedBy(1)),
            var hexValue: UInt32 = 0
            where NSScanner(string: hexString).scanHexInt(&hexValue) else {
                throw Error.UnableToScanHexValue
        }
        
        guard hexString.characters.count  == 3
            || hexString.characters.count == 4
            || hexString.characters.count == 6
            || hexString.characters.count == 8 else {
                throw Error.MismatchedHexStringLength
        }
        
        switch hexString.characters.count {
        case 3: self.init(hex3: UInt16(hexValue))
        case 4: self.init(hex4: UInt16(hexValue))
        case 6: self.init(hex6: hexValue)
        default: self.init(hex8: hexValue)
        }
    }
    
    class func OCTomatoColor() -> UIColor {
        return UIColor(red: 233.0 / 255.0, green: 83.0 / 255.0, blue: 37.0 / 255.0, alpha: 1.0)
    }
    
    class func OCPaleRedColor() -> UIColor {
        return UIColor(red: 220.0 / 255.0, green: 78.0 / 255.0, blue: 65.0 / 255.0, alpha: 1.0)
    }
    
    class func OCOceanBlueColor() -> UIColor {
        return UIColor(red: 0.0, green: 119.0 / 255.0, blue: 181.0 / 255.0, alpha: 1.0)
    }
    
    class func OCSilverColor() -> UIColor {
        return UIColor(red: 191.0 / 255.0, green: 191.0 / 255.0, blue: 195.0 / 255.0, alpha: 1.0)
    }
    
    class func OCDustyOrangeColor() -> UIColor {
        return UIColor(red: 243.0 / 255.0, green: 149.0 / 255.0, blue: 57.0 / 255.0, alpha: 1.0)
    }
    
    class func OCDenimBlueColor() -> UIColor {
        return UIColor(red: 59.0 / 255.0, green: 89.0 / 255.0, blue: 152.0 / 255.0, alpha: 1.0)
    }
    
    class func OCWhiteColor() -> UIColor {
        return UIColor(white: 249.0 / 255.0, alpha: 1.0)
    }
    
    class func OCGreyishBrownColor() -> UIColor {
        return UIColor(white: 86.0 / 255.0, alpha: 1.0)
    }
    
    class func OCSilverTwoColor() -> UIColor {
        return UIColor(red: 206.0 / 255.0, green: 206.0 / 255.0, blue: 210.0 / 255.0, alpha: 1.0)
    }
    
    class func OCTurquoiseColor() -> UIColor {
        return UIColor(red: 0.0, green: 198.0 / 255.0, blue: 174.0 / 255.0, alpha: 1.0)
    }
    
    class func OCWarmGreyColor() -> UIColor {
        return UIColor(white: 155.0 / 255.0, alpha: 1.0)
    }
}

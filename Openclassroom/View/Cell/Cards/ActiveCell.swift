//
//  ActiveCell.swift
//  Openclassroom
//
//  Created by Paul on 06/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import Cartography

class ActiveCell: AbstractCard {
    
    override static func cellIdentifier() -> String {
        return "ActiveCell"
    }
    
    func setUI() {
        let title = UILabel()
        title.font = UIFont.boldSystemFontOfSize(24.0)
        title.textColor = UIColor.OCGreyishBrownColor()
        title.textAlignment = .Center
        title.text = "Introduction"
        
        let subtitle = UILabel()
        subtitle.font = UIFont.systemFontOfSize(12.0)
        subtitle.textColor = UIColor.OCSilverColor()
        subtitle.textAlignment = .Center
        subtitle.text = "10 minutes"
        
        self.addSubview(title)
        self.addSubview(subtitle)
        
        constrain(title, containerView) {
            title, container in
            title.top == container.top + 20
            title.leading == container.leading + 20
            title.trailing == container.trailing - 20
        }
        
        constrain(subtitle, title, containerView) {
            subtitle, title, container in
            subtitle.top == title.bottom + 2
            subtitle.leading == container.leading + 20
            subtitle.trailing == container.trailing - 20
        }
    }
}

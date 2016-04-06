//
//  AbstractCard.swift
//  Openclassroom
//
//  Created by Paul on 06/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import Cartography

class AbstractCard: UICollectionViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    class func cellIdentifier() -> String {
        return ""
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    private func setup() {
        let containerView = UIView()
        
        containerView.backgroundColor = UIColor.whiteColor()
        
        self.addSubview(containerView)
        
        constrain(containerView, self) {
            containerView, cell in
            containerView.top == cell.top
            containerView.bottom == cell.bottom
            containerView.leading == cell.leading + 30
            containerView.trailing == cell.trailing - 30
        }
    }
}

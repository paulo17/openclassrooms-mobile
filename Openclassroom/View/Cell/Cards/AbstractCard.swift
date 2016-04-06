//
//  AbstractCard.swift
//  Openclassroom
//
//  Created by Paul on 06/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import Cartography

protocol CardProtocol {
    static func cellIdentifier() -> String
    func setup() -> Void
}

class AbstractCard: UICollectionViewCell {
    
    var containerView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupContainer()
    }
    
    private func setupContainer() {
        containerView = UIView()
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

//
//  CircleCardContentView.swift
//  Openclassroom
//
//  Created by Paul on 30/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import Cartography
import KYCircularProgress

class CircleCardContentView: UIView {

    lazy var cardIcon: UIImageView = UIImageView()
    
    var circularProgressBar: KYCircularProgress!
    var cardDelegate: CardProtocol!
    
    var circleColor: UIColor = UIColor.OCWhiteColor() {
        didSet {
            circularProgressBar.progressGuideColor = circleColor
        }
    }
    
    var circleProgressColor: UIColor = UIColor.OCDustyOrangeColor() {
        didSet {
            circularProgressBar.colors = [circleProgressColor]
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = CGRect(x: 0.0, y: 0.0, width: 200.0, height: 200.0)
        
        setupCircle()
        setupImage()
        progressChangeDelegate() // start progress change delegate
        
        // subviews
        self.addSubview(circularProgressBar)
        circularProgressBar.addSubview(cardIcon)
        
        // constraints
        constrain(self, circularProgressBar, cardIcon) {
            container, circle, image in
            container.height == 200
            container.width == 200
            
            circle.top == container.top
            circle.leading == container.leading
            circle.trailing == container.trailing
            circle.bottom == container.bottom
            
            image.height == 65
            image.width == 65
            image.centerX == container.centerX
            image.centerY == container.centerY
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Progress Change Delegate
    
    func progressChangeDelegate() {
        circularProgressBar.progressChangedClosure { (progress, circularView) in
            let progressPercentage = Int(progress*100)
            
            if progressPercentage == 100 {
                self.cardDelegate.percentage.textColor = UIColor.OCTurquoiseColor()
            } else {
                self.cardDelegate.percentage.textColor = UIColor.OCDustyOrangeColor()
            }
            
            self.cardDelegate.percentage.text = "\(progressPercentage)%"
        }
    }
    
    // MARK: - Setup UI
    
    private func setupCircle() {
        circularProgressBar = KYCircularProgress(frame: self.frame, showProgressGuide: true)
        
        circularProgressBar.colors = [circleProgressColor]
        circularProgressBar.lineWidth = 4.0
        circularProgressBar.guideLineWidth = 4.0
        circularProgressBar.progressGuideColor = circleColor
        
        circularProgressBar.progress = 0.0
    }
    
    private func setupImage() {
        cardIcon.image = UIImage(named: "TextWaitingIcon")
        cardIcon.contentMode = .ScaleAspectFill
    }
}

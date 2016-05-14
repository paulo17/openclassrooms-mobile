//
//  ViewController.swift
//  Openclassroom
//
//  Created by Paul on 01/02/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import KYCircularProgress
import Cartography

class ViewController: UIViewController {
    
    @IBOutlet weak var test: UIView!
    var circleContainer: UIView!
    
    private var circularProgressBar: KYCircularProgress!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleContainer = UIView()
        
        circleContainer.frame = CGRect(x: 0, y: 0, width: 200.0, height: 200.0)
        
        self.view.addSubview(circleContainer)
        
        constrain(circleContainer) {
            circleContainer in
            circleContainer.height == 200
            circleContainer.width == 200
            circleContainer.centerX == circleContainer.superview!.centerX
            circleContainer.centerY == circleContainer.superview!.centerY
        }
        
        circularProgressBar = KYCircularProgress(frame: circleContainer.frame, showProgressGuide: true)
        
        circularProgressBar.colors = [UIColor.OCDustyOrangeColor()]
        circularProgressBar.lineWidth = 5.0
        circularProgressBar.guideLineWidth = 5.0
        circularProgressBar.progressGuideColor = UIColor.OCSilverColor()
        
        circularProgressBar.progress = 0.8
        
        circleContainer.addSubview(circularProgressBar)
        
        constrain(circleContainer, circularProgressBar) {
            container, bar in
            bar.edges == container.edges
        }
        
    }
    
}

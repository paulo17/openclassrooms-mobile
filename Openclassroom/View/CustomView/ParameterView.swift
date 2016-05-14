//
//  ParameterView.swift
//  Openclassroom
//
//  Created by Paul on 27/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class ParameterView: UIView {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var identifier: String!
    var delegate: ParameterViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUI()
    }
    
    // MARK: - UI
    
    func setUI() {
        let leftBorder = CALayer()
        leftBorder.backgroundColor = UIColor.OCTurquoiseColor().CGColor
        leftBorder.frame = CGRect(x: 0, y: 0, width: 10.0, height: CGRectGetHeight(self.frame)) // create rectangle
        
        self.layer.addSublayer(leftBorder)
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 0.1
    }
    
    // MARK: - Action
    
    @IBAction func changeParameter() {
        self.delegate?.changeProfileParameter(self.identifier)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.delegate?.changeProfileParameter(self.identifier)
    }
    
}

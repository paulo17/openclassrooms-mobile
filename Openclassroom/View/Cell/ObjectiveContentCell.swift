//
//  ObjectiveContentCell.swift
//  Openclassroom
//
//  Created by cordi on 22/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class ObjectiveContentCell: UITableViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUI() {
        self.backgroundColor = UIColor.redColor()
    }

}

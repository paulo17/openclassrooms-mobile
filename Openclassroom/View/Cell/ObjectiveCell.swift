//
//  ObjectiveContentCell.swift
//  Openclassroom
//
//  Created by cordi on 22/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class ObjectiveCell: UITableViewCell {
    
    // MARK: - @IBOutlets
    @IBOutlet weak var roundBackgroundView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var finishButton: UIButton!
    ////
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}

//
//  LeconCollectionViewCell.swift
//  Openclassroom
//
//  Created by Paul on 08/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class LeconCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        downloadButton.OCborderButton(UIColorFromRGBA("BFBFC3"))
    }
    
}

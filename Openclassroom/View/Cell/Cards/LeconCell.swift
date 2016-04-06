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
    @IBOutlet weak var startButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        startButton.OCdefaultButton(UIColor.OCDustyOrangeColor())
        downloadButton.OCborderButton(UIColor.OCTurquoiseColor())
    }
    
    func initializeCellWithContent(lecon: Lecon) {
        title.text = lecon.title
        time.text = "\(lecon.time) minutes"
        
        let name = lecon.status ? "\(lecon.type)Icon" : "\(lecon.type)DisableIcon"
        
        if let imageIcon = UIImage(named: name) {
            icon.image = imageIcon
        }
    }
    
}

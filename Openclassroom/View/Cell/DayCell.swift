//
//  TimeCell.swift
//  Openclassroom
//
//  Created by Paul on 22/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class DayCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var daySwitch: UISwitch!
    
    weak var delegate: DaySwitchDelegate?
    var index: Int!
    
    func initializeCellWithContent(day: String, atIndex index: Int) {
        dayLabel.text = day
        self.index = index
    }
    
    @IBAction func switchChangedAction(sender: UISwitch) {
        delegate?.didChangeSwitchState(self, status: sender.on)
    }
}

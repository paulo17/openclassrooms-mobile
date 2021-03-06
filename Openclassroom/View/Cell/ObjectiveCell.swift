//
//  ObjectiveCell.swift
//  Openclassroom
//
//  Created by Paul on 21/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class ObjectiveCell: UITableViewCell {
    
    @IBOutlet weak var objectiveName: UILabel!
    @IBOutlet weak var objectiveDuration: UILabel!
    
    func initializeCellWithContent(objective: Objective) {
        objectiveName.text = objective.name
        objectiveDuration.text = "\(objective.duration) heures"
    }
}

//
//  ProfileObjectiveCell.swift
//  Openclassroom
//
//  Created by Paul on 18/05/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class ProfileObjectiveCell: UITableViewCell {
    
    static let identifier = "profile_objective_cell"
    
    var objective: Objective! {
        didSet {
            objectiveNameLabel.text = objective.name
            objectiveDurationLabel.text = "\(objective.duration) heures"
        }
    }
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var objectiveNameLabel: UILabel!
    @IBOutlet weak var objectiveDurationLabel: UILabel!
    
    // MARK: - UI Lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}

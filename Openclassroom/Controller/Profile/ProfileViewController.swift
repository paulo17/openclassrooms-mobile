//
//  ProfileViewController.swift
//  Openclassroom
//
//  Created by Paul on 17/05/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var backgroundHeaderView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var objectiveLabel: UILabel!
    @IBOutlet weak var totalDaysLabel: UILabel!
    @IBOutlet weak var totalCardsLabel: UILabel!
    @IBOutlet weak var totalDaysLeftLabel: UILabel!
    @IBOutlet weak var changeObjectiveButton: UIButton!
    
    // MARK: - UI Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.textColor = UIColor.whiteColor()
        
        let colorMain = try! UIColor(rgba_throws: "#F39539")
        let colorSecondary = try! UIColor(rgba_throws: "#C21945")
        
        backgroundHeaderView.image = CAGradientLayer.createGradient([colorMain.CGColor, colorSecondary.CGColor], bounds: headerView.bounds)
        
        changeObjectiveButton.OCborderButton()
        
        /*if let currentObjective = DataContainer.sharedDataContainer.currentUser.objective {
         objectiveLabel.text = currentObjective
         }*/
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}

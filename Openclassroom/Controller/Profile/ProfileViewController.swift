//
//  ProfileViewController.swift
//  Openclassroom
//
//  Created by Paul on 17/05/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var backgroundHeaderView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var objectiveLabel: UILabel!
    @IBOutlet weak var totalDaysLabel: UILabel!
    @IBOutlet weak var totalCardsLabel: UILabel!
    @IBOutlet weak var totalDaysLeftLabel: UILabel!
    @IBOutlet weak var changeObjectiveButton: UIButton!
    @IBOutlet weak var objectiveTableView: UITableView!
    
    lazy var objectives: [Objective] = [Objective]()
    
    // MARK: - UI Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        objectives.appendContentsOf(Objective.getStaticObjective())
        
        usernameLabel.textColor = UIColor.whiteColor()
        changeObjectiveButton.OCborderButton()
        objectiveTableView.rowHeight = UITableViewAutomaticDimension
        objectiveTableView.estimatedRowHeight = 60.0
        
        let colorMain = UIColor.OCDustyOrangeColor()
        let colorSecondary = UIColor.OCLipstickColor()
        
        backgroundHeaderView.image = CAGradientLayer.createGradient([colorMain.CGColor, colorSecondary.CGColor], bounds: headerView.bounds)
        
        
        if let currentObjective = DataContainer.sharedDataContainer.currentUser.objective {
            objectiveLabel.text = currentObjective
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = ""
        navigationBar.OCInvisibleNavigationBar()
        
        let backImage = UIImage(named: "Back")
        let settingsImage = UIImage(named: "Settings")
        
        let profileNavigationItem = UINavigationItem()
        
        profileNavigationItem.leftBarButtonItem = UIBarButtonItem(image: backImage, style: .Plain, target: self, action: #selector(ProfileViewController.back))
        
        profileNavigationItem.rightBarButtonItem = UIBarButtonItem(image: settingsImage, style: .Plain, target: self, action: #selector(ProfileViewController.showSettings))
        
        navigationBar.setItems([profileNavigationItem], animated: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        /*if let navigationController = self.navigationController as? OCExpandNavigationController {
         navigationController.setNavigationBarUI() // reset navigation bar to default
         }*/
    }
    
    func showSettings() {
        
    }
    
    func back() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - UITableView Datasource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectives.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = objectiveTableView.dequeueReusableCellWithIdentifier(ProfileObjectiveCell.identifier, forIndexPath: indexPath) as! ProfileObjectiveCell
        
        let objective: Objective = objectives[indexPath.row]
        cell.objective = objective
        
        return cell
    }
    
    // MARK: - IB Actions
    
    @IBAction func changeObjective(sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let parameterViewController = mainStoryboard.instantiateViewControllerWithIdentifier("ParameterViewController")
        
        self.presentViewController(parameterViewController, animated: true, completion: nil)
    }
    
}

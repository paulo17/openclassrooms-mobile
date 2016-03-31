//
//  ParameterViewController.swift
//  Openclassroom
//
//  Created by Paul on 24/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

protocol ParameterViewDelegate: class {
    func changeProfileParameter(parameterType: String)
}

class ParameterViewController: UIViewController, ParameterViewDelegate {
    
    @IBOutlet weak var objectiveView: ParameterView!
    @IBOutlet weak var dayView: ParameterView!
    @IBOutlet weak var timeView: ParameterView!
    @IBOutlet weak var validateButton: UIButton!
    
    var objective: Objective?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        objectiveView.delegate = self
        dayView.delegate = self
        timeView.delegate = self
        
        objectiveView.identifier = "objective"
        dayView.identifier = "day"
        timeView.identifier = "time"
        
        setUI()
        showUserParemeters()
    }
    
    func showUserParemeters() {
        objectiveView.content.text = DataContainer.sharedDataContainer.currentUser.category
    }
    
    func setUI() {
        validateButton.OCborderButton(UIColor.OCDustyOrangeColor())
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Vos paramètres"
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // MARK: - ParameterView Delegate
    
    func changeProfileParameter(identifier: String) {
        var setupController: UIViewController?
        
        switch identifier {
        case "objective":
             setupController = storyboard?.instantiateViewControllerWithIdentifier("categoryViewController") as! CategoryViewController
            break
        case "day":
             setupController = storyboard?.instantiateViewControllerWithIdentifier("dayViewController") as! DayViewController
            break
        case "time":
            setupController = storyboard?.instantiateViewControllerWithIdentifier("timeViewController") as! TimeViewController
            break
        default:
            break
        }
        
        if let controller = setupController {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    // MARK: - IB Action
    
    @IBAction func confirmParameterAction(sender: UIButton) {
        // save user parameter to database
        //let user = DataContainer.sharedDataContainer.currentUser
    }
    
}

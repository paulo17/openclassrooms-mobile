//
//  ParameterViewController.swift
//  Openclassroom
//
//  Created by Paul on 24/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

// MARK: - ParameterView Delegate

protocol ParameterViewDelegate: class {
    func changeProfileParameter(parameterType: String)
}

class ParameterViewController: UIViewController, ParameterViewDelegate {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var objectiveView: ParameterView!
    @IBOutlet weak var dayView: ParameterView!
    @IBOutlet weak var timeView: ParameterView!
    @IBOutlet weak var validateButton: UIButton!
    
    var objective: Objective?
    
    // MARK: - UI Lifecycle
    
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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Paramètres de l'objectif"
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // MARK: - UI Setup
    
    func showUserParemeters() {
        if let objective = DataContainer.sharedDataContainer.currentUser.objective {
            objectiveView.content.text = objective
        }
        
        if let days = DataContainer.sharedDataContainer.currentUser.daysOfWeek {
            dayView.content.text = Days.humanReadable(days)
        }
        
        if let time = DataContainer.sharedDataContainer.currentUser.time {
            timeView.content.text = "\(time) minutes"
        }
    }
    
    func setUI() {
        validateButton.OCborderButton(UIColor.OCDustyOrangeColor())
    }
    
    // MARK: - ParameterView Delegate
    
    func changeProfileParameter(identifier: String) {
        var setupController: UIViewController!
        
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
    
    // MARK: - IB Actions
    
    @IBAction func confirmParameterAction(sender: UIButton) {
        // persist user data
        UserManager.saveContext()
        
        // instanciate cards navigation controller
        let cardsStoryboard = UIStoryboard(name: "Cards", bundle: nil)
        let cardsNavigationController = cardsStoryboard.instantiateViewControllerWithIdentifier("CardsNavigationController") as! OCExpandNavigationController
        
        // redirect to cards navigation controller
        cardsNavigationController.modalTransitionStyle = .CrossDissolve
        presentViewController(cardsNavigationController, animated: true, completion: nil)
    }
    
}

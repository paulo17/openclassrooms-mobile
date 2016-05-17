//
//  CardEndViewController.swift
//  Openclassroom
//
//  Created by Paul on 17/05/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import Cartography

class CardEndViewController: MainCardViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var newObjectiveButton: UIButton!
    
    // MARK: - UI Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newObjectiveButton.OCdefaultButton()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // MARK: - IB Actions
    
    @IBAction func chooseNewObjectiveAction(sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let setupNavigationController = mainStoryboard.instantiateViewControllerWithIdentifier("setupNavigationController") as! UINavigationController
        
        presentViewController(setupNavigationController, animated: true, completion: nil)
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

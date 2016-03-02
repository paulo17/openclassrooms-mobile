//
//  ViewController.swift
//  Openclassroom
//
//  Created by Paul on 01/02/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import Crashlytics
import BWWalkthrough

class ViewController: UIViewController, BWWalkthroughViewControllerDelegate {
    
    lazy var walkthroughMaster: BWWalkthroughViewController = BWWalkthroughViewController()
    let app_mode = NSBundle.mainBundle().objectForInfoDictionaryKey("App Mode") as! String
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if(!userDefaults.boolForKey("walkthroughClosed") || app_mode == "DEV") {
            showWalkthrough()
        }
        
    }
    
    func showWalkthrough() {
        let walkthroughStoryboard = UIStoryboard(name: "Walkthrough", bundle: nil)
        
        walkthroughMaster = walkthroughStoryboard.instantiateViewControllerWithIdentifier("walkthrough_master") as! BWWalkthroughViewController
        
        let page_one = walkthroughStoryboard.instantiateViewControllerWithIdentifier("walkthrough1")
        let page_two = walkthroughStoryboard.instantiateViewControllerWithIdentifier("walkthrough2")
        let page_three = walkthroughStoryboard.instantiateViewControllerWithIdentifier("walkthrough3")
        
        walkthroughMaster.delegate = self
        walkthroughMaster.addViewController(page_one)
        walkthroughMaster.addViewController(page_two)
        walkthroughMaster.addViewController(page_three)
        
        self.presentViewController(walkthroughMaster, animated: true, completion: nil)
    }
    
    // MARK: - Walkthrough delegate
    
    func walkthroughPageDidChange(pageNumber: Int) {
        if(pageNumber == 2) {
            if let closeButton = walkthroughMaster.closeButton {
                closeButton.hidden = true
            }
        } else {
            if let closeButton = walkthroughMaster.closeButton {
                closeButton.hidden = false
            }
            
        }
    }
    
    func walkthroughCloseButtonPressed() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = mainStoryboard.instantiateViewControllerWithIdentifier("mainViewController") as! ViewController
        
        redirect(from: self, to: mainViewController)
        
        // set walkthroughClosed key to true for prevent review
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setBool(true, forKey: "walkthroughClosed")
        userDefaults.synchronize()
    }
    
}


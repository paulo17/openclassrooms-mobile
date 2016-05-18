//
//  CustomWalkthroughPageViewController.swift
//  Openclassroom
//
//  Created by Paul on 02/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import BWWalkthrough

class CustomWalkthroughPageViewController: UIViewController {
    
    @IBOutlet weak var letsgo: UIButton!
    
    var masterWalkthroughViewController: BWWalkthroughViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func launchApp(sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginNavigationController = mainStoryboard.instantiateViewControllerWithIdentifier("loginNavigationController") as! UINavigationController
        
        if let masterWalkthrough = masterWalkthroughViewController {
            redirect(from: masterWalkthrough, to: loginNavigationController)
        }
        
        // set walkthroughClosed key to true for prevent review
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setBool(true, forKey: "walkthroughClosed")
        userDefaults.synchronize()
    }
}

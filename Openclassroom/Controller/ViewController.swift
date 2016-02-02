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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        showWalkthrough()
    }
    
    func showWalkthrough() {
        let walkthroughStoryboard = UIStoryboard(name: "Walkthrough", bundle: nil)
        let walkthroughMaster = walkthroughStoryboard.instantiateViewControllerWithIdentifier("walkthrough_master") as! BWWalkthroughViewController
        
        let page_one = walkthroughStoryboard.instantiateViewControllerWithIdentifier("walkthrough1")
        let page_two = walkthroughStoryboard.instantiateViewControllerWithIdentifier("walkthrough2")
        let page_three = walkthroughStoryboard.instantiateViewControllerWithIdentifier("walkthrough3")
        
        walkthroughMaster.addViewController(page_one)
        walkthroughMaster.addViewController(page_two)
        walkthroughMaster.addViewController(page_three)
        
        self.presentViewController(walkthroughMaster, animated: true, completion: nil)
    }
    
}


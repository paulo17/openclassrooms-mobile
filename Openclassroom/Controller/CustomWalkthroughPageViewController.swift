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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        letsgo.backgroundColor = UIColor.clearColor()
        letsgo.layer.cornerRadius = 25
        letsgo.layer.borderWidth = 1
        letsgo.layer.borderColor = UIColor.whiteColor().CGColor
    }
    
    @IBAction func launchApp(sender: AnyObject) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = mainStoryboard.instantiateViewControllerWithIdentifier("mainViewController") as! ViewController
        
        self.presentViewController(mainViewController, animated: false, completion: nil)
    }
    
}
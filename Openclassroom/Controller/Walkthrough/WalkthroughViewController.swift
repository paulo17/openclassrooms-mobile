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

class WalkthroughViewController: UIViewController, BWWalkthroughViewControllerDelegate {
    
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
    
    func setStatusBarBackground(controller: UIViewController) {
        let statusBarView: UIView = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, 22))
        statusBarView.backgroundColor = UIColorFromRGBA("F39539")
        controller.view.addSubview(statusBarView)
    }
    
    func showWalkthrough() {
        let walkthroughStoryboard = UIStoryboard(name: "Walkthrough", bundle: nil)
        
        walkthroughMaster = walkthroughStoryboard.instantiateViewControllerWithIdentifier("walkthrough_master") as! BWWalkthroughViewController
        setStatusBarBackground(walkthroughMaster)
        
        let page_one = walkthroughStoryboard.instantiateViewControllerWithIdentifier("walkthrough1")
        let page_two = walkthroughStoryboard.instantiateViewControllerWithIdentifier("walkthrough2")
        let page_three = walkthroughStoryboard.instantiateViewControllerWithIdentifier("walkthrough3") as! CustomWalkthroughPageViewController
        
        walkthroughMaster.delegate = self
        page_three.masterWalkthroughViewController = walkthroughMaster // add masterWaltkrought reference for close
        
        walkthroughMaster.addViewController(page_one)
        walkthroughMaster.addViewController(page_two)
        walkthroughMaster.addViewController(page_three)
        
        self.presentViewController(walkthroughMaster, animated: true, completion: nil)
    }
    
    // MARK: - Walkthrough delegate
    
    func walkthroughPageDidChange(pageNumber: Int) {
        if let closeButton = walkthroughMaster.closeButton, let pageControl = walkthroughMaster.pageControl {
            if pageNumber == 2 {
                closeButton.hidden = true
                pageControl.hidden = true
            } else {
                closeButton.hidden = false
                pageControl.hidden = false
            }
        }
    }
    
    func walkthroughCloseButtonPressed() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainViewController = mainStoryboard.instantiateViewControllerWithIdentifier("mainViewController") as! MainViewController
        
        redirect(from: walkthroughMaster, to: mainViewController)
        
        // set walkthroughClosed key to true for prevent review
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setBool(true, forKey: "walkthroughClosed")
        userDefaults.synchronize()
    }
    
}


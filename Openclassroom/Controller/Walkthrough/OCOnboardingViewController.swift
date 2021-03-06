//
//  OCOnboardingViewController.swift
//  Openclassroom
//
//  Created by Paul on 16/05/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import BWWalkthrough
import Cartography

class OCOnboardingViewController: BWWalkthroughViewController, BWWalkthroughViewControllerDelegate {
    
    // MARK: - UI Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as? String
        
        showWalkthrough()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        scrollview.bounces = false
        automaticallyAdjustsScrollViewInsets = false
    }
    
    // MARK: - UI Setup
    
    func showWalkthrough() {
        let walkthroughStoryboard = UIStoryboard(name: "Walkthrough", bundle: nil)
        delegate = self // set current controller as walkthrough delegate
        
        let page_one = walkthroughStoryboard.instantiateViewControllerWithIdentifier("walkthrough1")
        let page_two = walkthroughStoryboard.instantiateViewControllerWithIdentifier("walkthrough2")
        let page_three = walkthroughStoryboard.instantiateViewControllerWithIdentifier("walkthrough3") as! CustomWalkthroughPageViewController
        
        page_three.masterWalkthroughViewController = self // add masterWaltkrought reference for close
        
        addViewController(page_one)
        addViewController(page_two)
        addViewController(page_three)
        
        setBoxShadow(page_one.view)
        setBoxShadow(page_two.view)
        setBoxShadow(page_three.view)
        
        constrain(page_one.view, page_two.view, page_three.view, view) {
            page_one, page_two, page_three, container in
            page_one.top == container.top
            page_one.bottom == container.bottom
        }
        
    }
    
    private func setBoxShadow(view: UIView) {
        // add border shadow
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.blackColor().CGColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        view.layer.shadowOpacity = 0.1
    }
    
    // MARK: - Walkthrough delegate
    
    func walkthroughPageDidChange(pageNumber: Int) {
        if let closeButton = self.closeButton, let pageControl = self.pageControl {
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
        let loginNavigationController = mainStoryboard.instantiateViewControllerWithIdentifier("loginNavigationController") as! UINavigationController
        
        redirect(from: self, to: loginNavigationController)
        
        // set walkthroughClosed key to true for prevent review
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setBool(true, forKey: "walkthroughClosed")
        userDefaults.synchronize()
    }
    
}

//
//  LoginViewController.swift
//  Openclassroom
//
//  Created by Paul on 02/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        loginButton.OCdefaultButton(UIColorFromRGBA("F39539"))
    }
    
    // MARK: - IBAction
    
    @IBAction func loginAction(sender: AnyObject) {
        let setupNavigationController = storyboard?.instantiateViewControllerWithIdentifier("setupNavigationController") as! UINavigationController
        
        setupNavigationController.modalTransitionStyle = .FlipHorizontal
        self.presentViewController(setupNavigationController, animated: true, completion: nil)
    }
}

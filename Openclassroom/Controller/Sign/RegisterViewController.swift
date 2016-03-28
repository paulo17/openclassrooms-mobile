//
//  RegisterViewController.swift
//  Openclassroom
//
//  Created by Paul on 02/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        registerButton.OCdefaultButton(UIColor.OCDustyOrangeColor())
        loginButton.OCborderButton(UIColor.OCDustyOrangeColor())
    }
    
    // MARK: - IBAction
    
    @IBAction func registerAction(sender: AnyObject) {
        if let mainViewController = storyboard?.instantiateViewControllerWithIdentifier("mainViewController") {
            mainViewController.modalTransitionStyle = .FlipHorizontal
            self.presentViewController(mainViewController, animated: true, completion: nil)
        }
    }
}

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
        loginButton.OCdefaultButton(UIColor.OCDustyOrangeColor())
    }
    
    // MARK: - IBAction
    
    @IBAction func loginAction(sender: AnyObject) {
        guard let email = emailTextField.text where !email.isEmpty,
            let password = passwordTextField.text where !password.isEmpty else {
                
                let alert = UIAlertController(title: "Données invalides", message: "Veuillez renseigner tous les champs", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
                return self.presentViewController(alert, animated: true, completion: nil)
        }
        
        guard let user = UserManager.authenticateUser(email, password: password) else {
            let alert = UIAlertController(title: "Données invalides", message: "L'email ou le mot de passe est invalide", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
            
            passwordTextField.text = ""
            
            return self.presentViewController(alert, animated: true, completion: nil)
        }
        
        // share user accross application with singleton pattern
        DataContainer.sharedDataContainer.currentUser = user
        
        // redirect to setup pipe
        let setupNavigationController = storyboard?.instantiateViewControllerWithIdentifier("setupNavigationController") as! UINavigationController
        
        setupNavigationController.modalTransitionStyle = .FlipHorizontal
        return self.presentViewController(setupNavigationController, animated: true, completion: nil)
    }
    
}

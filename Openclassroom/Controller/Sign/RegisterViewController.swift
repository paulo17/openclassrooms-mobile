//
//  RegisterViewController.swift
//  Openclassroom
//
//  Created by Paul on 02/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        repeatTextField.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        registerButton.OCdefaultButton(UIColor.OCDustyOrangeColor())
        loginButton.OCborderButton(UIColor.OCDustyOrangeColor())
    }
    
    // MARK: - IBAction
    
    @IBAction func registerAction(sender: AnyObject) {
        guard let email = emailTextField.text where !email.isEmpty,
            let password = passwordTextField.text where !password.isEmpty,
            let repeatPassword = repeatTextField.text where !repeatPassword.isEmpty
            else {
                
                let alert = UIAlertController(title: "Données invalides", message: "Veuillez renseigner tous les champs", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Annuler", style: UIAlertActionStyle.Cancel, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
                return
        }
        
        guard password == repeatPassword else {
            let alert = UIAlertController(title: "Données invalides", message: "Les mots de passes ne correspondent pas", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Annuler", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)

            passwordTextField.text = ""
            repeatTextField.text = ""
            
            return
        }
        
        // register and setup user to datacontainer
        let user = UserManager.createUser(email, password: password)
        DataContainer.sharedDataContainer.currentUser = user
        
        // redirect to setup pipe
        if let setupNavigationController = storyboard?.instantiateViewControllerWithIdentifier("setupNavigationController") {
            setupNavigationController.modalTransitionStyle = .FlipHorizontal
            return self.presentViewController(setupNavigationController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Textfield Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let nextTag: Int = textField.tag + 1
        
        // recursive search of uiview by tag
        let nextResponder: UIResponder? = textField.superview?.viewWithTag(nextTag)
        
        if let nextR = nextResponder {
            nextR.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return false
    }

}

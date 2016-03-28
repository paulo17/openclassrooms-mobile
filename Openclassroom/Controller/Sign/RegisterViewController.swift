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
        registerButton.OCdefaultButton(UIColorFromRGBA("F39539"))
        loginButton.OCborderButton(UIColorFromRGBA("F39539"))
    }
    
    func handleRegister() {
        
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
        
        UserManager.createUser(email, password: password)
        
        if let mainViewController = storyboard?.instantiateViewControllerWithIdentifier("mainViewController") {
            mainViewController.modalTransitionStyle = .FlipHorizontal
            self.presentViewController(mainViewController, animated: true, completion: nil)
        }
    }
}

//
//  LoginViewController.swift
//  Openclassroom
//
//  Created by Paul on 02/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var inputStackView: UIStackView!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var bottomStackConstraint: NSLayoutConstraint!
    
    
    // MARK: - UI Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        /*NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
         
         NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)*/
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    override func viewWillAppear(animated: Bool) {
        loginButton.OCdefaultButton(UIColor.OCDustyOrangeColor())
    }
    
    override func viewDidLayoutSubviews() {
        emailTextField.OCDefaultTextField(nil)
        passwordTextField.OCDefaultTextField(nil)
    }
    
    // MARK: - Keyboard notifications methods
    
    /*func keyboardWillShow(notification: NSNotification) {
     adjustingHeight(true, notification: notification)
     }
     
     func keyboardWillHide(notification: NSNotification) {
     adjustingHeight(false, notification: notification)
     }
     
     func adjustingHeight(show: Bool, notification: NSNotification) {
     
     var userInfo = notification.userInfo!
     
     let keyboardFrame: CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue()
     
     let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSTimeInterval
     
     let changeInHeight = (show) ? CGRectGetHeight(keyboardFrame) : 240
     
     UIView.animateWithDuration(animationDurarion, animations: { () -> Void in
     self.bottomStackConstraint.constant = changeInHeight
     })
     }*/
    
    
    // MARK: - IB Action
    
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        self.navigationItem.title = ""
    }
    
}

//
//  SignInViewController.swift
//  Openclassroom
//
//  Created by Paul on 02/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import Cartography

class SignInViewController: UIViewController {
    
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var linkedinButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.topItem?.title = "Connexion / Inscription"
    }
    
    override func viewWillAppear(animated: Bool) {
        loginButton.OCborderButton(UIColor.OCDustyOrangeColor())
    }
    
}

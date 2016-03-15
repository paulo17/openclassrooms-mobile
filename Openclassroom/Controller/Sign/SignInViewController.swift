//
//  SignInViewController.swift
//  Openclassroom
//
//  Created by Paul on 02/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var linkedinButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        facebookButton.OCdefaultButton(UIColorFromRGBA("3B5998"))
        googleButton.OCdefaultButton(UIColorFromRGBA("DC4E41"))
        linkedinButton.OCdefaultButton(UIColorFromRGBA("0077B5"))
        emailButton.OCdefaultButton(UIColorFromRGBA("F9F9F9"))
        loginButton.OCborderButton(UIColorFromRGBA("F39539"))
    }
}

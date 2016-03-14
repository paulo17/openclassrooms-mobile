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
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(animated: Bool) {
        facebookButton.OCdefaultButton(UIColorFromRGBA("3B5998"))
        googleButton.OCdefaultButton(UIColorFromRGBA("D13832"))
        linkedinButton.OCdefaultButton(UIColorFromRGBA("2162A6"))
        emailButton.OCdefaultButton(UIColorFromRGBA("B2B1B6"))
    }
}

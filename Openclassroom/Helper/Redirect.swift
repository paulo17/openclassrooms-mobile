//
//  Redirect.swift
//  Openclassroom
//
//  Created by Paul on 02/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

/**
 Redirect by changing present view controller
 
 - parameter current:  UIViewControlelr
 - parameter to:      UIViewController
 */
func redirect(from current: UIViewController, to: UIViewController) {
    to.modalTransitionStyle = .CrossDissolve
    current.presentViewController(to, animated: true, completion: nil)
}

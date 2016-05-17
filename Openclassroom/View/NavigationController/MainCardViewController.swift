//
//  CardNavigationController.swift
//  Openclassroom
//
//  Created by Paul on 17/05/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class MainCardViewController: UIViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let account = UIImage(named: "account")
        let resume = UIImage(named: "resume")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: resume, style: .Plain, target: self, action: #selector(MainCardViewController.showResume))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: account, style: .Plain, target: self, action: #selector(MainCardViewController.showProfile))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation bar actions
    
    func showResume() {
        print("show resume")
    }
    
    func showProfile() {
        print("show profile")
    }
    
}

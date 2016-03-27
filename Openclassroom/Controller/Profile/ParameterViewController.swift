//
//  ParameterViewController.swift
//  Openclassroom
//
//  Created by Paul on 24/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class ParameterViewController: UIViewController {
    
    @IBOutlet weak var objectiveView: ParameterView!
    @IBOutlet weak var dayView: ParameterView!
    @IBOutlet weak var timeView: ParameterView!
    
    var objective: Objective?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Vos paramètres"
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}

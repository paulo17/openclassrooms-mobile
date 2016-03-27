//
//  ParameterViewController.swift
//  Openclassroom
//
//  Created by Paul on 24/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

protocol ParameterViewDelegate: class {
    func changeProfileParameter(parameterType: String)
}

class ParameterViewController: UIViewController, ParameterViewDelegate {
    
    @IBOutlet weak var objectiveView: ParameterView!
    @IBOutlet weak var dayView: ParameterView!
    @IBOutlet weak var timeView: ParameterView!
    
    var objective: Objective?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        objectiveView.delegate = self
        dayView.delegate = self
        timeView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Vos paramètres"
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    // MARK: - ParameterView Delegate
    
    func changeProfileParameter(parameterType: String) {
        print("change this in controller")
    }
}

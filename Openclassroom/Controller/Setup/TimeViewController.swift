//
//  TimeViewController.swift
//  Openclassroom
//
//  Created by Paul on 16/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var timePicker: UIPickerView!
    @IBOutlet weak var validateButton: UIButton!
    
    lazy var times: [Int] = [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60]
    
    // MARK: - UI Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timePicker.dataSource = self
        timePicker.delegate = self
        
        setUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Etape 3 sur 3"
    }
    
    func setUI() {
        validateButton.OCdefaultButton(UIColor.OCDustyOrangeColor())
    }
    
    // MARK: - PickerView Data Source
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return times.count
    }
    
    // MARK: - PickerView Delegate
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(times[row]) minutes"
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let rowIndex = timePicker.selectedRowInComponent(0)
        
        DataContainer.sharedDataContainer.currentUser.time = times[rowIndex]
    }
}

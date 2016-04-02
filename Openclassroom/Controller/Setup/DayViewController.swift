//
//  DayViewController.swift
//  Openclassroom
//
//  Created by Paul on 16/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

protocol DaySwitchDelegate: class {
    func didChangeSwitchState(sender: DayCell, status: Bool)
}

class DayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DaySwitchDelegate {
    
    @IBOutlet weak var timeTableView: UITableView!
    @IBOutlet weak var validateButton: UIButton!
    
    let timeCellIdentifier: String = "timeCell"
    let daysOfWeek: [String] = DaysOfWeek.days
    
    lazy var selectedDays: [String] = [String]()
    
    //lazy var selectedDays = Dictionary<Int, String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeTableView.delegate = self
        timeTableView.dataSource = self
        
        validateButton.OCdefaultButton(UIColor.OCWarmGreyColor())
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = "Etape 2 sur 3"
    }
    
    func toggleValidateButton() {
        if selectedDays.count > 0 {
            validateButton.enabled = true
            validateButton.OCdefaultButton(UIColor.OCDustyOrangeColor())
        } else {
            validateButton.enabled = false
            validateButton.OCdefaultButton(UIColor.OCWarmGreyColor())
        }
    }
    
    // MARK: - TableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return daysOfWeek.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = timeTableView.dequeueReusableCellWithIdentifier(self.timeCellIdentifier, forIndexPath: indexPath) as! DayCell
        cell.initializeCellWithContent(daysOfWeek[indexPath.row], atIndex: indexPath.row)
        cell.delegate = self // delegate for switch change event
        
        return cell
    }
    
    // MARK: - DaySwitchDelegate
    
    func didChangeSwitchState(sender: DayCell, status: Bool) {
        if let day = sender.dayLabel.text {
            if status {
                selectedDays.append(day)
            } else {
                selectedDays = selectedDays.filter { $0 != day }
            }
        }
        
        // set button color enable/disable
        toggleValidateButton()
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationItem.title = "" // remove navigation title
        
        DataContainer.sharedDataContainer.currentUser.daysOfWeek = selectedDays
    }
    
}

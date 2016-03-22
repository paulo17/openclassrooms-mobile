//
//  DayViewController.swift
//  Openclassroom
//
//  Created by Paul on 16/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class DayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var timeTableView: UITableView!
    @IBOutlet weak var validateButton: UIButton!
    
    let timeCellIdentifier = "timeCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeTableView.delegate = self
        timeTableView.dataSource = self
        
        validateButton.OCdefaultButton(UIColorFromRGBA("ceced2"))
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = "Vos disponiblités"
    }
    
    // MARK: - TableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = timeTableView.dequeueReusableCellWithIdentifier(self.timeCellIdentifier, forIndexPath: indexPath) as! DayCell
        
        return cell
    }
}

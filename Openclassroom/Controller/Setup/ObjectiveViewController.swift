//
//  ObjectiveViewController.swift
//  Openclassroom
//
//  Created by Paul on 16/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class ObjectiveViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryObjectiveNumber: UILabel!
    @IBOutlet weak var objectiveTableView: UITableView!
    
    let objectiveCellIdentifier = "objectiveCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        objectiveTableView.delegate = self
        objectiveTableView.dataSource = self
    }
    
    // MARK: - TableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = objectiveTableView.dequeueReusableCellWithIdentifier(objectiveCellIdentifier, forIndexPath: indexPath) as! ObjectiveCell
        
        return cell
    }
}

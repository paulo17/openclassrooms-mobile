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
    
    var category: Category!
    lazy var objectives = [Objective]()
    
    // MARK: - UI Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        objectiveTableView.delegate = self
        objectiveTableView.dataSource = self
        objectiveTableView.rowHeight = UITableViewAutomaticDimension
        objectiveTableView.estimatedRowHeight = 60.0
        
        objectives.appendContentsOf(Objective.getStaticObjective())
        
        if let category = self.category {
            categoryName.text = category.name
            categoryImage.image = UIImage(named: category.image)
            categoryObjectiveNumber.text = "\(objectives.count) cours"
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = "Etape 1 sur 3"
    }
    
    // MARK: - TableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectives.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = objectiveTableView.dequeueReusableCellWithIdentifier(objectiveCellIdentifier, forIndexPath: indexPath) as! ObjectiveCell
        let objective = objectives[indexPath.row]
        
        cell.initializeCellWithContent(objective)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        DataContainer.sharedDataContainer.currentUser.objective = objectives[indexPath.row].name
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationItem.title = "" // remove navigation title
    }
}

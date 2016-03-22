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
    lazy var objectives = [Objective]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        objectiveTableView.rowHeight = UITableViewAutomaticDimension
        objectiveTableView.estimatedRowHeight = 20.0
        
        objectives = getStaticObjective()
    }
    
    override func viewWillAppear(animated: Bool) {
        objectiveTableView.delegate = self
        objectiveTableView.dataSource = self
        
        self.title = "Choisir un objectif"
    }
    
    func getStaticObjective() -> [Objective] {
        var objectives = [Objective]()
        var i = 1
        
        for objective in Objective.objectives {
            objectives.append(Objective(id: i, name: objective["name"]!))
            i++
        }
        
        return objectives
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
}

//
//  ProgramViewController.swift
//  Openclassroom
//
//  Created by Paul on 16/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class ProgramViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var objectives = [NSDictionary]()
    @IBOutlet weak var objectivesTableView: UITableView!
    
    override func viewDidLoad() {
        objectives = [
            ["type": "title", "text": "Qu'est ce que le Web ?"],
            ["type": "subtitle", "text": "Introduction"],
            ["type": "subtitle", "text": "Qu'est ce que le Web ?"],
            ["type": "subtitle", "text": "Web, Services & Cloud"],
            ["type": "subtitle", "text": "Comment est né le Web ?"],
            ["type": "subtitle", "text": "En résumé"],
            ["type": "title", "text": "Les langages du Web"],
            ["type": "subtitle", "text": "Les langages client"],
            ["type": "subtitle", "text": "Les langages serveur"]
        ]
        
        objectivesTableView.registerClass(ObjectiveTitleCell.self, forCellReuseIdentifier: "title_cell")
        
        objectivesTableView.registerClass(ObjectiveContentCell.self, forCellReuseIdentifier: "content_cell")
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectives.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        if objectives[indexPath.row]["type"]! as! String == "title" {
            cell = objectivesTableView.dequeueReusableCellWithIdentifier(<#T##identifier: String##String#>, forIndexPath: <#T##NSIndexPath#>)
        } else if objectives[indexPath.row]["type"]! as! String == "subtitle" {
            cell = ObjectiveContentCell()
        }
        
        return cell
    }
}

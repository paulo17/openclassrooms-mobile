//
//  ProgramViewController.swift
//  Openclassroom
//
//  Created by Paul on 16/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class ProgramViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Variables
    var objectives = [NSDictionary]()
    
    // MARK: - @IBOutlets
    @IBOutlet weak var objectivesTableView: UITableView!
    
    // MARK: - UI Lifecycle
    
    override func viewDidLoad() {
        objectives = [
            ["type": "title", "text": "Qu'est ce que le Web ?", "nb": "1"],
            ["type": "subtitle", "text": "Introduction"],
            ["type": "subtitle", "text": "Qu'est ce que le Web ?"],
            ["type": "subtitle", "text": "Web, Services & Cloud"],
            ["type": "subtitle", "text": "Comment est né le Web ?"],
            ["type": "subtitle", "text": "En résumé"],
            ["type": "title", "text": "Les langages du Web", "nb": "2"],
            ["type": "subtitle", "text": "Les langages client"],
            ["type": "subtitle", "text": "Les langages serveur"],
            ["type": "btn", "text": "Choisir"]
        ]
        
        objectivesTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = "Comprendre le web"
    }
    
    // MARK: - TableView Delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectives.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = objectivesTableView.dequeueReusableCellWithIdentifier(ProgramCell.identifier, forIndexPath: indexPath) as! ProgramCell
        
        cell.selectionStyle = .None
        cell.delegate = self
        
        switch self.objectives[indexPath.row]["type"] as! String {
        case "title":
            cell.roundBackgroundView.backgroundColor = UIColor.OCDustyOrangeColor()
            cell.roundBackgroundView.layer.cornerRadius = 17.0
            
            cell.numberLabel.text = self.objectives[indexPath.row]["nb"] as? String
            cell.numberLabel.textColor = UIColor.whiteColor()
            cell.numberLabel.font = UIFont.boldSystemFontOfSize(18.0)
            
            cell.titleLabel.text = self.objectives[indexPath.row]["text"]! as? String
            cell.titleLabel.font = UIFont.boldSystemFontOfSize(18.0)
            
            cell.finishButton.hidden = true
            break
        case "subtitle":
            cell.titleLabel.text = self.objectives[indexPath.row]["text"]! as? String
            cell.titleLabel.font = cell.titleLabel.font.fontWithSize(15.0)
            cell.titleLabel.textColor = UIColor.OCSilverColor()
            
            cell.finishButton.hidden = true
            
            break
        case "btn":
            cell.finishButton.hidden = false
            cell.finishButton.setTitle(self.objectives[indexPath.row]["text"]! as? String, forState: .Normal)
            cell.finishButton.titleLabel?.font = UIFont.boldSystemFontOfSize(16.0)
            cell.finishButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            cell.finishButton.backgroundColor = UIColor.OCDustyOrangeColor()
            cell.finishButton.layer.cornerRadius = 4.0
            cell.finishButton.frame.size.width = self.view.frame.width / 100 * 90
            
            cell.separatorInset = UIEdgeInsetsMake(0, CGRectGetWidth(cell.bounds)/2.0, 0, CGRectGetWidth(cell.bounds)/2.0)
            break
        default:
            break
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height: CGFloat!
        
        switch self.objectives[indexPath.row]["type"] as! String {
        case "title":
            height = 88.0
            break
        case "subtitle":
            height = 44.0
            break
        case "btn":
            height = 110.0
            break
        default:
            break
        }
        
        return height
    }
    
    // MARK: - Navigation
    
    func chooseProgram() {
        performSegueWithIdentifier("programToDay", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        navigationItem.title = "" // remove navigation title
    }
    
}

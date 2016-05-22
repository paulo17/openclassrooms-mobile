//
//  CardSummaryViewController.swift
//  Openclassroom
//
//  Created by Paul on 19/05/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import Cartography

class CardSummaryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var objectiveSummaryTableView: UITableView!
    
    // MARK: - Instance variable
    
    var objectives = [
        ["type": "title", "text": "Qu'est ce que le Web ?", "nb": "1"],
        ["type": "subtitle", "text": "Introduction"],
        ["type": "subtitle", "text": "Qu'est ce que le Web ?"],
        ["type": "subtitle", "text": "Web, Services & Cloud"],
        ["type": "subtitle", "text": "Comment est né le Web ?"],
        ["type": "subtitle", "text": "En résumé"],
        ["type": "title", "text": "Les langages du Web", "nb": "2"],
        ["type": "subtitle", "text": "Les langages client"],
        ["type": "subtitle", "text": "Les langages serveur"],
        ]
    
    // MARK: - UI Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        objectiveSummaryTableView.dataSource = self
        objectiveSummaryTableView.delegate = self
        objectiveSummaryTableView.tableFooterView?.hidden = true
        
        self.addNavigationBar()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - UI NavigationBar
    
    func addNavigationBar() {
        navigationBar.OCInvisibleNavigationBar()
        
        let navigationItem = UINavigationItem()
        
        let accountImage = UIImage(named: "account")
        let backImage = UIImage(named: "Back")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backImage, style: .Plain, target: self, action: #selector(CardSummaryViewController.back))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: accountImage, style: .Plain, target: self, action: #selector(CardSummaryViewController.showProfile))
        
        navigationBar.setItems([navigationItem], animated: true)
    }
    
    // MARK: - Navigation Item actions
    
    func back() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func showProfile() {
        self.navigationItem.title = "" // remove back button title for profile view
        let cardStoryboard = UIStoryboard(name: "Cards", bundle: nil)
        let profileViewController = cardStoryboard.instantiateViewControllerWithIdentifier("ProfileViewController")
        presentViewController(profileViewController, animated: true, completion: nil)
    }
    
    // MARK: - UITableView Datasource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectives.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = objectiveSummaryTableView.dequeueReusableCellWithIdentifier(ProgramCell.identifier, forIndexPath: indexPath) as! ProgramCell
        
        cell.selectionStyle = .None
        
        switch self.objectives[indexPath.row]["type"]! {
        case "title":
            cell.roundBackgroundView.backgroundColor = UIColor.OCDustyOrangeColor()
            cell.roundBackgroundView.layer.cornerRadius = 17.0
            
            cell.numberLabel.text = self.objectives[indexPath.row]["nb"]
            cell.numberLabel.textColor = UIColor.whiteColor()
            cell.numberLabel.font = UIFont.boldSystemFontOfSize(18.0)
            
            cell.titleLabel.text = self.objectives[indexPath.row]["text"]!
            cell.titleLabel.font = UIFont.boldSystemFontOfSize(18.0)
            
            break
        case "subtitle":
            cell.titleLabel.text = self.objectives[indexPath.row]["text"]!
            cell.titleLabel.font = cell.titleLabel.font.fontWithSize(15.0)
            cell.titleLabel.textColor = UIColor.OCSilverColor()
            
            break
        default:
            break
        }
        
        return cell
    }
    
    // MARK: - UITableView Delegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height: CGFloat!
        
        switch self.objectives[indexPath.row]["type"]! {
        case "title":
            height = 88.0
            break
        case "subtitle":
            height = 44.0
            break
        default:
            break
        }
        
        return height
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let image = UIImage(named: "table_header_bg")
        
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 200))
        backgroundImageView.image = image
        backgroundImageView.contentMode = .ScaleAspectFill
        
        let titleLabel = UILabel()
        titleLabel.text = "COMPRENDRE LE WEB"
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.boldSystemFontOfSize(24.0)
        titleLabel.textAlignment = .Center
        titleLabel.numberOfLines = 0
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = "Auteur : Mathieu Nebra"
        subtitleLabel.textColor = UIColor.whiteColor()
        subtitleLabel.font = UIFont.systemFontOfSize(14.0)
        subtitleLabel.textAlignment = .Center
        subtitleLabel.numberOfLines = 0
        
        backgroundImageView.addSubview(titleLabel)
        backgroundImageView.addSubview(subtitleLabel)
        
        let container = UITableViewHeaderFooterView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 200))
        
        constrain(titleLabel, subtitleLabel, backgroundImageView) {
            title, subtitle, image in
            title.top == image.top + 90
            title.leading == image.leading + 40
            title.trailing == image.trailing - 40
            
            subtitle.top == title.bottom + 5
            subtitle.leading == image.leading + 40
            subtitle.trailing == image.trailing - 40
        }
        
        container.backgroundView = backgroundImageView
        
        return container
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
}

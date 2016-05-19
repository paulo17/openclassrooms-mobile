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
    
    @IBOutlet weak var objectiveSummaryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        objectiveSummaryTableView.dataSource = self
        objectiveSummaryTableView.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - UITableView Datasource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = objectiveSummaryTableView.dequeueReusableCellWithIdentifier(ProgramCell.identifier, forIndexPath: indexPath) as! ProgramCell
        
        return cell
    }
    
    // MARK: - UITableView Delegate
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 200))
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
        
        constrain(titleLabel, subtitleLabel, backgroundImageView) {
            title, subtitle, image in
            title.top == image.top + 90
            title.leading == image.leading + 40
            title.trailing == image.trailing - 40
            
            subtitle.top == title.bottom + 5
            subtitle.leading == image.leading + 40
            subtitle.trailing == image.trailing - 40
        }
        
        containerView.addSubview(backgroundImageView)
        
        return containerView
    }
}

//
//  ActiveCell.swift
//  Openclassroom
//
//  Created by Paul on 06/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import Cartography

class ActiveCell: AbstractCard, CardProtocol {
    
    lazy var title: UILabel! = UILabel()
    lazy var subtitle: UILabel! = UILabel()
    lazy var percentage: UILabel! = UILabel()
    lazy var startButton: UIButton! = UIButton()
    lazy var downloadButton: UIButton! = UIButton()
    
    var circleContainer: CircleCardContentView! = CircleCardContentView()
    
    var delegate: CardControllerDelegate!
    
    static func cellIdentifier() -> String {
        return "ActiveCell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        circleContainer.cardDelegate = self
        
        setupTitle()
        setupSubtitle()
        setupPercentage()
        setupStartButton()
        setupDownloadButton()
        
        self.addSubview(title)
        self.addSubview(subtitle)
        
        self.addSubview(circleContainer)
        
        self.addSubview(percentage)
        self.addSubview(startButton)
        self.addSubview(downloadButton)
        
        constrain(title, subtitle, circleContainer, percentage, containerView) {
            title, subtitle, circle, percentage, container in
            title.top == container.top + 20
            title.leading == container.leading + 20
            title.trailing == container.trailing - 20
            title.height == 30
            
            subtitle.top == title.bottom + 2
            subtitle.leading == container.leading + 20
            subtitle.trailing == container.trailing - 20
            
            circle.top == subtitle.bottom + 25
            circle.centerX == container.centerX
            
            percentage.top == circle.bottom + 7
            percentage.leading == container.leading + 120
            percentage.trailing == container.trailing - 120
        }
        
        constrain(downloadButton, startButton, containerView) {
            download, start, container in
            download.bottom == container.bottom - 30
            download.leading == container.leading + 95
            download.trailing == container.trailing - 95
            download.height == 26
            
            start.bottom == download.top - 10
            start.leading == container.leading + 20
            start.trailing == container.trailing - 20
            start.height == 40
        }
        
        startButton.addTarget(self, action: #selector(ActiveCell.start), forControlEvents: .TouchUpInside)
        downloadButton.addTarget(self, action: #selector(ActiveCell.download), forControlEvents: .TouchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - IB Action
    
    func start() {
        // reset card ui
        circleContainer.circularProgressBar.progress = 0
        circleContainer.circleProgressColor = UIColor.OCDustyOrangeColor()
        
        percentage.textColor = UIColor.OCDustyOrangeColor()
        percentage.text = "0%"
        
        // execute card view controller start delegate method
        delegate.start(sender: self)
    }
    
    func download() {
        delegate.download(sender: self)
    }
    
    // MARK: - Setup content
    
    func content(card: Card) -> Void {
        let status = card.cardStatus
        
        title.text = card.title
        subtitle.text = "\(card.time) minutes"
        circleContainer.cardIcon.image = UIImage(named: cardImagePath(card))
        startButton.setTitle(status == .Done ? "Recommencer" : "Commencer", forState: .Normal)
        
        if status == .Done {
            circleContainer.circleProgressColor = UIColor.OCTurquoiseColor()
            circleContainer.circularProgressBar.progress = 1.0
        }
    }
    
    // MARK: - Setup UI elements
    
    private func setupTitle() {
        title.font = UIFont.boldSystemFontOfSize(24.0)
        title.textColor = UIColor.OCGreyishBrownColor()
        title.textAlignment = .Center
        title.numberOfLines = 1
        title.adjustsFontSizeToFitWidth = true
        title.minimumScaleFactor = 0.5
    }
    
    private func setupSubtitle() {
        subtitle.font = UIFont.systemFontOfSize(12.0)
        subtitle.textColor = UIColor.OCSilverColor()
        subtitle.textAlignment = .Center
        subtitle.text = "Card's time"
    }
    
    private func setupPercentage() {
        percentage.text = "0%"
        percentage.textAlignment = .Center
        percentage.textColor = UIColor.OCDustyOrangeColor()
        percentage.numberOfLines = 0
        percentage.font = UIFont.systemFontOfSize(24.0)
    }
    
    private func setupStartButton() {
        startButton.setTitle("Commencer", forState: .Normal)
        startButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        startButton.titleLabel?.textAlignment = .Center
        startButton.titleLabel?.font = UIFont.systemFontOfSize(16.0, weight: 0.2)
        startButton.OCdefaultButton(UIColor.OCDustyOrangeColor())
        startButton.userInteractionEnabled = true
        startButton.setTitleColor(UIColor.OCSilverColor(), forState: .Highlighted)
    }
    
    private func setupDownloadButton() {
        downloadButton.setTitle("TELECHARGER", forState: .Normal)
        downloadButton.setTitleColor(UIColor.OCTurquoiseColor(), forState: .Normal)
        downloadButton.titleLabel?.font = UIFont.systemFontOfSize(14.0, weight: 0.2)
        downloadButton.titleLabel?.textAlignment = .Center
        downloadButton.OCborderButton(UIColor.OCTurquoiseColor())
    }
}

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
    
    var title: UILabel! = UILabel()
    var subtitle: UILabel! = UILabel()
    var imageView: UIImageView! = UIImageView()
    var percentage: UILabel! = UILabel()
    var startButton: UIButton! = UIButton()
    var downloadButton: UIButton! = UIButton()
    
    var delegate: CardControllerDelegate!
    
    static func cellIdentifier() -> String {
        return "ActiveCell"
    }
    
    func setup() {
        setupTitle()
        setupSubtitle()
        setupImage()
        setupPercentage()
        setupStartButton()
        setupDownloadButton()
        
        self.addSubview(title)
        self.addSubview(subtitle)
        self.addSubview(imageView)
        self.addSubview(percentage)
        self.addSubview(startButton)
        self.addSubview(downloadButton)
        
        constrain(title, subtitle, imageView, percentage, containerView) {
            title, subtitle, image, percentage, container in
            title.top == container.top + 20
            title.leading == container.leading + 20
            title.trailing == container.trailing - 20
            
            subtitle.top == title.bottom + 2
            subtitle.leading == container.leading + 20
            subtitle.trailing == container.trailing - 20
            
            image.top == subtitle.bottom + 90
            image.height == 65
            image.width == 65
            image.centerX == container.centerX
            
            percentage.top == image.bottom + 70
            percentage.leading == container.leading + 140
            percentage.trailing == container.trailing - 140
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
        
        startButton.addTarget(self, action: #selector(ActiveCell.test), forControlEvents: .TouchUpInside)
    }
    
    func test() {
        
    }
    
    // MARK: - Setup content
    
    func content(card: Card) -> Void {
        title.text = card.title
        subtitle.text = "\(card.time) minutes"
        imageView.image = UIImage(named: cardImagePath(card))
    }
    
    // MARK: - Setup UI elements
    
    private func setupTitle() {
        title.font = UIFont.boldSystemFontOfSize(24.0)
        title.textColor = UIColor.OCGreyishBrownColor()
        title.textAlignment = .Center
        title.numberOfLines = 0
        title.text = "Card's title"
    }
    
    private func setupSubtitle() {
        subtitle.font = UIFont.systemFontOfSize(12.0)
        subtitle.textColor = UIColor.OCSilverColor()
        subtitle.textAlignment = .Center
        subtitle.text = "Card's time"
    }
    
    private func setupImage() {
        imageView.image = UIImage(named: "TextDisableIcon")
        imageView.contentMode = .ScaleAspectFit
    }
    
    private func setupPercentage() {
        percentage.text = "0%"
        percentage.textAlignment = .Center
        percentage.textColor = UIColor.OCDustyOrangeColor()
        percentage.font = UIFont.systemFontOfSize(24.0)
    }
    
    private func setupStartButton() {
        startButton.setTitle("Commencer", forState: .Normal)
        startButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        startButton.titleLabel?.textAlignment = .Center
        startButton.titleLabel?.font = UIFont.systemFontOfSize(16.0, weight: 0.2)
        startButton.OCdefaultButton(UIColor.OCDustyOrangeColor())
    }
    
    private func setupDownloadButton() {
        downloadButton.setTitle("TELECHARGER", forState: .Normal)
        downloadButton.setTitleColor(UIColor.OCTurquoiseColor(), forState: .Normal)
        downloadButton.titleLabel?.font = UIFont.systemFontOfSize(14.0, weight: 0.2)
        downloadButton.titleLabel?.textAlignment = .Center
        downloadButton.OCborderButton(UIColor.OCTurquoiseColor())
    }
}

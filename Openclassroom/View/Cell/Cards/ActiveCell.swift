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
    
    static func cellIdentifier() -> String {
        return "ActiveCell"
    }
    
    func setup() {
        let title = setupTitle()
        let subtitle = setupSubtitle()
        let imageView = setupImage()
        let percentage = setupPercentage()
        let startButton = setupStartButton()
        let downloadButton = setupDownloadButton()
        
        self.addSubview(title)
        self.addSubview(subtitle)
        self.addSubview(imageView)
        self.addSubview(percentage)
        self.addSubview(startButton)
        self.addSubview(downloadButton)
        
        constrain(title, containerView) {
            title, container in
            title.top == container.top + 20
            title.leading == container.leading + 20
            title.trailing == container.trailing - 20
        }
        
        constrain(subtitle, title, containerView) {
            subtitle, title, container in
            subtitle.top == title.bottom + 2
            subtitle.leading == container.leading + 20
            subtitle.trailing == container.trailing - 20
        }
        
        constrain(imageView, subtitle, containerView) {
            image, subtitle, container in
            image.top == subtitle.bottom + 90
            image.height == 65
            image.width == 65
            image.centerX == container.centerX
        }
        
        constrain(percentage, imageView, containerView) {
            percentage, image, container in
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
        }
        
        constrain(startButton, downloadButton, containerView) {
            button, download, container in
            button.bottom == download.top - 10
            button.leading == container.leading + 20
            button.trailing == container.trailing - 20
            button.height == 40
        }
    }
    
    private func setupTitle() -> UILabel {
        let title = UILabel()
        title.font = UIFont.boldSystemFontOfSize(24.0)
        title.textColor = UIColor.OCGreyishBrownColor()
        title.textAlignment = .Center
        title.text = "Introduction"
        
        return title
    }
    
    private func setupSubtitle() -> UILabel{
        let subtitle = UILabel()
        subtitle.font = UIFont.systemFontOfSize(12.0)
        subtitle.textColor = UIColor.OCSilverColor()
        subtitle.textAlignment = .Center
        subtitle.text = "10 minutes"
        
        return subtitle
    }
    
    private func setupImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "TextDisableIcon")
        imageView.contentMode = .ScaleAspectFit

        return imageView
    }
    
    private func setupPercentage() -> UILabel {
        let percentage = UILabel()
        percentage.text = "0%"
        percentage.textAlignment = .Center
        percentage.textColor = UIColor.OCDustyOrangeColor()
        percentage.font = UIFont.systemFontOfSize(24.0)
        
        return percentage
    }
    
    private func setupStartButton() -> UIButton {
        let startButton = UIButton()
        startButton.setTitle("Commencer", forState: .Normal)
        startButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        startButton.titleLabel?.textAlignment = .Center
        startButton.titleLabel?.font = UIFont.systemFontOfSize(20.0)
        startButton.OCdefaultButton(UIColor.OCDustyOrangeColor())
        
        return startButton
    }
    
    private func setupDownloadButton() -> UIButton {
        let downloadButton = UIButton()
        downloadButton.setTitle("TELECHARGER", forState: .Normal)
        downloadButton.setTitleColor(UIColor.OCTurquoiseColor(), forState: .Normal)
        downloadButton.titleLabel?.font = UIFont.systemFontOfSize(16.0)
        downloadButton.OCborderButton(UIColor.OCTurquoiseColor())
        
        return downloadButton
    }
}

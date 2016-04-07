//
//  StartCell.swift
//  Openclassroom
//
//  Created by Paul on 06/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import Cartography

class StartCell: AbstractCard, CardProtocol {
    
    lazy var title: UILabel! = UILabel()
    lazy var subtitle: UILabel! = UILabel()
    lazy var imageView: UIImageView! = UIImageView()
    lazy var percentage: UILabel! = UILabel()
    lazy var startButton: UIButton! = UIButton()
    lazy var downloadButton: UIButton! = UIButton()
    
    static func cellIdentifier() -> String {
        return "StartCell"
    }
    
    func setup() -> Void {
        setupTitle()
        setupSubtitle()
        setupNextButton()
        setupImage()
        
        self.addSubview(imageView)
        imageView.addSubview(title)
        imageView.addSubview(subtitle)
        imageView.addSubview(startButton)
        
        constrain(imageView, containerView) {
            image, container in
            image.edgesWithinMargins == container.edges
        }
        
        constrain(title, subtitle, imageView, startButton) {
            title, subtitle, container, button in
            title.top == container.top + 205
            title.centerX == container.centerX
            
            subtitle.top == title.bottom + 5
            subtitle.centerX == container.centerX
            
            button.height == 38
            button.bottom == container.bottom - 30
            button.leading == container.leading + 20
            button.trailing == container.trailing - 20
        }
    }
    
    private func setupTitle() {
        title.font = UIFont.boldSystemFontOfSize(24.0)
        title.textColor = UIColor.whiteColor()
        title.textAlignment = .Center
        title.numberOfLines = 0
        title.text = "Jour 1 sur 20"
    }
    
    private func setupSubtitle() {
        subtitle.font = UIFont.systemFontOfSize(18.0)
        subtitle.textColor = UIColor.whiteColor()
        subtitle.textAlignment = .Center
        subtitle.text = "Vous avez 2 cours aujourd’hui"

    }
    
    private func setupImage() {
        let image = UIImage(named: "wallpaperlesson")
        imageView.image = image
        imageView.contentMode = .ScaleAspectFit
    }
    
    private func setupNextButton() {
        startButton.setTitle("Suivant", forState: .Normal)
        startButton.setTitleColor(UIColor.OCDustyOrangeColor(), forState: .Normal)
        startButton.titleLabel?.textAlignment = .Center
        startButton.titleLabel?.font = UIFont.systemFontOfSize(18.0)
        startButton.OCdefaultButton(UIColor.whiteColor())
    }

}

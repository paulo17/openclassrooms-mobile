//
//  DisableCell.swift
//  Openclassroom
//
//  Created by Paul on 06/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import Cartography

class DisableCell: AbstractCard, CardProtocol {
    
    lazy var title: UILabel! = UILabel()
    lazy var subtitle: UILabel! = UILabel()
    lazy var imageView: UIImageView! = UIImageView()
    lazy var percentage: UILabel! = UILabel()
    lazy var startButton: UIButton! = UIButton()
    lazy var downloadButton: UIButton! = UIButton()
    
    private lazy var lockImage: UIImageView! = UIImageView()
    private lazy var lockTitle: UILabel! = UILabel()
    
    static func cellIdentifier() -> String {
        return "DisableCell"
    }
    
    func setup() -> Void {
        setupTitle()
        setupSubtitle()
        setupImage()
        setupLock()
        setupLockTitle()
        setupStartButton()
        
        self.addSubview(title)
        self.addSubview(subtitle)
        self.addSubview(imageView)
        self.addSubview(lockImage)
        self.addSubview(lockTitle)
        self.addSubview(startButton)
        
        constrain(title, subtitle, imageView, containerView) {
            title, subtitle, image, container in
            title.top == container.top + 20
            title.leading == container.leading
            title.trailing == container.trailing
            
            subtitle.top == title.bottom + 2
            subtitle.leading == container.leading
            subtitle.trailing == container.trailing
            
            image.top == subtitle.bottom + 110
            image.centerX == container.centerX
            image.height == 65
            image.width == 65
        }
        
        constrain(imageView, lockImage, lockTitle, startButton, containerView) {
            image, lock, lockTitle, start, container in
            lock.top == image.bottom + 100
            lock.centerX == container.centerX
            lock.width == 18
            lock.height == 23
            
            lockTitle.top == lock.bottom + 5
            lockTitle.height == 35
            lockTitle.leading == container.leading + 20
            lockTitle.trailing == container.trailing - 20
            
            start.bottom == container.bottom - 20
            start.leading == container.leading + 20
            start.trailing == container.trailing - 20
            start.height == 38
        }
    }
    
    func content(card: Card) -> Void {
        title.text = card.title
        subtitle.text = "\(card.time) minutes"
    }
    
    private func setupTitle() {
        title.font = UIFont.boldSystemFontOfSize(24.0)
        title.textColor = UIColor.OCGreyishBrownColor()
        title.textAlignment = .Center
        title.numberOfLines = 0
        title.text = "Card's Title"
    }
    
    private func setupSubtitle() {
        subtitle.font = UIFont.systemFontOfSize(12.0)
        subtitle.textColor = UIColor.OCSilverColor()
        subtitle.textAlignment = .Center
        subtitle.text = "Card's subtitle"
    }
    
    private func setupImage() {
        imageView.image = UIImage(named: "shapetexte")
        imageView.contentMode = .ScaleAspectFit
    }
    
    private func setupLock() {
        lockImage.image = UIImage(named: "lock")
        lockImage.contentMode = .ScaleAspectFit
    }
    
    private func setupLockTitle() {
        lockTitle.font = UIFont.systemFontOfSize(14.0)
        lockTitle.textColor = UIColor.OCSilverColor()
        lockTitle.numberOfLines = 2
        lockTitle.lineBreakMode = .ByWordWrapping
        lockTitle.textAlignment = .Center
        lockTitle.text = "Vous devez finir le(s) cours précédent(s) pour débloquer cette partie"
    }
    
    private func setupStartButton() {
        startButton.setTitle("Commencer", forState: .Normal)
        startButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        startButton.titleLabel?.textAlignment = .Center
        startButton.titleLabel?.font = UIFont.systemFontOfSize(16.0)
        startButton.OCdefaultButton(UIColor.OCWarmGreyColor())

    }
}

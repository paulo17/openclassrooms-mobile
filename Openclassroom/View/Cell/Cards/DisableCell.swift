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
    lazy var percentage: UILabel! = UILabel()
    lazy var startButton: UIButton! = UIButton()
    lazy var downloadButton: UIButton! = UIButton()
    
    lazy var circleContainer: CircleCardContentView! = CircleCardContentView()

    var delegate: CardControllerDelegate!
    
    private lazy var lockImage: UIImageView! = UIImageView()
    private lazy var lockTitle: UILabel! = UILabel()
    
    static func cellIdentifier() -> String {
        return "DisableCell"
    }
    
    func setup() -> Void {
        setupTitle()
        setupSubtitle()
        setupLock()
        setupLockTitle()
        setupStartButton()
        
        self.addSubview(title)
        self.addSubview(subtitle)
        self.addSubview(circleContainer)
        self.addSubview(lockImage)
        self.addSubview(lockTitle)
        self.addSubview(startButton)
        
        constrain(title, subtitle, circleContainer, containerView) {
            title, subtitle, circle, container in
            title.top == container.top + 20
            title.leading == container.leading
            title.trailing == container.trailing
            
            circle.top == subtitle.bottom + 25
            circle.centerX == container.centerX
            
            subtitle.top == title.bottom + 2
            subtitle.leading == container.leading
            subtitle.trailing == container.trailing
        }
        
        constrain(circleContainer, lockImage, lockTitle, startButton, containerView) {
            circle, lock, lockTitle, start, container in
            lock.top == circle.bottom + 30
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
        circleContainer.cardIcon.image = UIImage(named: cardImagePath(card))
    }
    
    // MARK: - Setup UI
    
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
    
    private func setupLock() {
        lockImage.image = UIImage(named: "lock")
        lockImage.contentMode = .ScaleAspectFill
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

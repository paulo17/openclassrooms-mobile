//
//  FinishCell.swift
//  Openclassroom
//
//  Created by Paul on 06/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import Cartography

class FinishCell: AbstractCard, CardProtocol {
    
    // MARK: - UI Outlets
    
    lazy var title: UILabel! = UILabel()
    lazy var subtitle: UILabel! = UILabel()
    lazy var percentage: UILabel! = UILabel()
    lazy var startButton: UIButton! = UIButton()
    lazy var downloadButton: UIButton! = UIButton()
    lazy var circleContainer: CircleCardContentView! = CircleCardContentView()
    
    var delegate: CardControllerDelegate!
    
    static func cellIdentifier() -> String {
        return "FinishCell"
    }
    
    // MARK: - UI Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        circleContainer.cardDelegate = self
        
        setupTitle()
        setupStartButton()
        
        self.addSubview(title)
        self.addSubview(circleContainer)
        self.addSubview(startButton)
        
        constrain(circleContainer, containerView) {
            circle, container in
            circle.top == container.top + 110
            circle.centerX == container.centerX
        }
        
        constrain(title, circleContainer, startButton, containerView) {
            title, circle, button, container in
            title.top == circle.bottom + 30
            title.leading == container.leading + 20
            title.trailing == container.trailing - 20
            
            button.bottom == container.bottom - 35
            button.leading == container.leading + 30
            button.trailing == container.trailing - 30
            button.height == 44
        }
        
        startButton.addTarget(self, action: #selector(FinishCell.finish), forControlEvents: .TouchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - CardController Delegate
    
    func finish() {
        delegate.finish(sender: self)
    }
    
    // MARK: - Content setup
    
    func content(card: Card) {
        let status = card.cardStatus
        
        title.text = card.title
        circleContainer.cardIcon.image = status == .Done ?
            UIImage(named: "shapematch") :
            UIImage(named: "shapematchgrey")
        
        if status == .Done {
            circleContainer.circleProgressColor = UIColor.OCTurquoiseColor()
            circleContainer.circularProgressBar.progress = 1.0
            startButton.hidden = false
        }
    }
    
    // MARK: - UI Setup
    
    private func setupTitle() {
        title.font = UIFont.boldSystemFontOfSize(24.0)
        title.textColor = UIColor.OCGreyishBrownColor()
        title.textAlignment = .Center
        title.numberOfLines = 0
        title.text = "Journée non terminée"
    }
    
    private func setupStartButton() {
        startButton.setTitle("Continuer", forState: .Normal)
        startButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        startButton.titleLabel?.textAlignment = .Center
        startButton.titleLabel?.font = UIFont.systemFontOfSize(16.0, weight: 0.2)
        startButton.OCdefaultButton(UIColor.OCDustyOrangeColor())
        startButton.hidden = true
    }
    
    /*private func setupImage() {
     let image = UIImage(named: "shapematchgrey")
     imageView.image = image
     imageView.contentMode = .ScaleAspectFill
     }*/
}

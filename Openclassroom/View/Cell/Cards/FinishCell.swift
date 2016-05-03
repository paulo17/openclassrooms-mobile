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
    
    lazy var title: UILabel! = UILabel()
    lazy var subtitle: UILabel! = UILabel()
    //lazy var imageView: UIImageView! = UIImageView()
    lazy var percentage: UILabel! = UILabel()
    lazy var startButton: UIButton! = UIButton()
    lazy var downloadButton: UIButton! = UIButton()
    lazy var circleContainer: CircleCardContentView! = CircleCardContentView()
    
    var delegate: CardControllerDelegate!
    
    static func cellIdentifier() -> String {
        return "FinishCell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        circleContainer.cardDelegate = self
        
        setupTitle()
        
        self.addSubview(title)
        self.addSubview(circleContainer)
        
        constrain(circleContainer, containerView) {
            circle, container in
            circle.top == container.top + 110
            circle.centerX == container.centerX
        }
        
        constrain(title, circleContainer, containerView) {
            title, circle, container in
            title.top == circle.bottom + 30
            title.leading == container.leading + 20
            title.trailing == container.trailing - 20
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func content(card: Card) -> Void {
        let status = card.cardStatus
        
        title.text = card.title
        circleContainer.cardIcon.image = status == .Done ?
            UIImage(named: "shapematch") :
            UIImage(named: "shapematchgrey")
        
        if(status == .Done) {
            circleContainer.circleProgressColor = UIColor.OCTurquoiseColor()
            circleContainer.circularProgressBar.progress = 1.0
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
    
    /*private func setupImage() {
        let image = UIImage(named: "shapematchgrey")
        imageView.image = image
        imageView.contentMode = .ScaleAspectFill
    }*/
}

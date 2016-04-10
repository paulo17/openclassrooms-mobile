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
    lazy var imageView: UIImageView! = UIImageView()
    lazy var percentage: UILabel! = UILabel()
    lazy var startButton: UIButton! = UIButton()
    lazy var downloadButton: UIButton! = UIButton()
    
    var indexPath: NSIndexPath!
    var delegate: CardControllerDelegate!
    
    static func cellIdentifier() -> String {
        return "FinishCell"
    }
    
    func setup() -> Void {
        setupImage()
        setupTitle()
        
        self.addSubview(title)
        self.addSubview(imageView)
        
        constrain(imageView, containerView) {
            image, container in
            image.top == container.top + 175
            image.centerX == container.centerX
            image.width == 90
            image.height == 66
        }
        
        constrain(title, imageView, containerView) {
            title, image, container in
            title.top == image.bottom + 120
            title.leading == container.leading + 20
            title.trailing == container.trailing - 20
        }
    }
    
    func content(card: Card) -> Void {
        
    }
    
    func setupTitle() {
        title.font = UIFont.boldSystemFontOfSize(24.0)
        title.textColor = UIColor.OCGreyishBrownColor()
        title.textAlignment = .Center
        title.numberOfLines = 0
        title.text = "Journée non terminée"
    }
    
    func setupImage() {
        let image = UIImage(named: "shapematchgrey")
        imageView.image = image
        imageView.contentMode = .ScaleAspectFill
    }
}

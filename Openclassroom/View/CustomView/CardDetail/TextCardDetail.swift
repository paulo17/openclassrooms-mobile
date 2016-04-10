//
//  TextCardDetail.swift
//  Openclassroom
//
//  Created by Paul on 10/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import Cartography

class TextCardDetail: AbstractCardDetail {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTitle()
        setupImage()
        setupContent()
        
        self.addSubview(title)
        self.addSubview(content)
        self.addSubview(imageView)
        
        constrain(title, imageView, content, self) {
            title, image, content, container in
            image.top == container.top
            image.trailing == container.trailing
            image.leading == container.leading
            image.height == 135
            
            title.top == image.bottom + 20
            title.leading == container.leading + 20
            title.trailing == container.trailing - 20
            
            content.top == title.bottom + 40
            content.leading == container.leading + 15
            content.trailing == container.trailing - 15
            content.bottom == container.bottom - 15
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContent(card: Card) {
        title.text = card.title
    }
    
    func setupTitle() {
        title.font = UIFont.boldSystemFontOfSize(24.0)
        title.textColor = UIColor.OCGreyishBrownColor()
        title.textAlignment = .Center
        title.numberOfLines = 0
        title.text = "Card's title"
    }
    
    func setupContent() {
        
    }
    
    func setupImage() {
        imageView.image = UIImage(named: "Card Content Image")
        imageView.contentMode = .ScaleAspectFill
    }
}

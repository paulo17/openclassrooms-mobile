//
//  VideoCardDetail.swift
//  Openclassroom
//
//  Created by Paul on 10/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import Cartography

class VideoCardDetail: AbstractCardDetail {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTitle()
        setupContent()
        setupImage()
        
        self.addSubview(title)
        self.addSubview(imageView)
        self.addSubview(finishButton)
        self.addSubview(socialContent)
                
        constrain(title, imageView, self, finishButton, socialContent) {
            title, image, container, button, social in
            title.top == container.top + 30
            title.leading == container.leading + 20
            title.trailing == container.trailing - 20
            
            image.top == title.bottom + 30
            image.leading == container.leading
            image.trailing == container.trailing
            image.height == 210
            
            button.bottom == container.bottom - 30
            button.leading == container.leading + 30
            button.trailing == container.trailing - 30
            button.height == 44
            
            social.top == image.bottom
            social.height == 111
            social.leading == container.leading
            social.trailing == container.trailing
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        imageView.image = UIImage(named: "Video")
        imageView.contentMode = .ScaleAspectFill
    }
}

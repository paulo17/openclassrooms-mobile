//
//  SocialContentView.swift
//  Openclassroom
//
//  Created by Paul on 13/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import Cartography

@IBDesignable
class SocialContentView: UIView {

    var title: UILabel = UILabel()
    var facebook: UIImageView = UIImageView()
    var twitter: UIImageView = UIImageView()
    var linkedin: UIImageView = UIImageView()
    var google: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        
        setupTitle()
        setupImage()
        
        let imageContainerView = UIView()
        
        self.addSubview(title)
        self.addSubview(imageContainerView)
        imageContainerView.addSubview(facebook)
        imageContainerView.addSubview(twitter)
        imageContainerView.addSubview(linkedin)
        imageContainerView.addSubview(google)
        
        constrain(title, self) {
            title, container in
            title.top == container.top + 30
            title.leading == container.leading + 120
            title.trailing == container.trailing - 120
        }
        
        constrain(imageContainerView, title, self) {
            imageContainerView, title, container in
            imageContainerView.top == title.bottom + 10
            imageContainerView.leading == container.leading + 98
            imageContainerView.trailing == container.trailing - 98
            imageContainerView.bottom == container.bottom - 30
        }
        
        constrain(facebook, twitter, linkedin, google, imageContainerView) {
            facebook, twitter, linkedin, google, container in
            
            facebook.top == container.top
            facebook.bottom == container.bottom
            facebook.height == 22
            facebook.width == 22
            facebook.leading == container.leading
            
            twitter.top == container.top
            twitter.bottom == container.bottom
            twitter.height == 22
            twitter.width == 22
            
            linkedin.top == container.top
            linkedin.bottom == container.bottom
            linkedin.height == 22
            linkedin.width == 22
            
            google.top == container.top
            google.bottom == container.bottom
            google.height == 22
            google.width == 22
    
            distribute(by: 30, horizontally: facebook, twitter, linkedin, google)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupTitle() {
        title.font = UIFont.boldSystemFontOfSize(14.0)
        title.textColor = UIColor.OCGreyishBrownColor()
        title.textAlignment = .Center
        title.numberOfLines = 0
        title.text = "Partager"
    }
    
    private func setupImage() {
        facebook.image = UIImage(named: "Facebook")
        twitter.image = UIImage(named: "Twitter")
        linkedin.image = UIImage(named: "Linkedin")
        google.image = UIImage(named: "Google")
        
        facebook.contentMode = .ScaleAspectFill
        twitter.contentMode = .ScaleAspectFill
        linkedin.contentMode = .ScaleAspectFill
        google.contentMode = .ScaleAspectFill
    }
    
}

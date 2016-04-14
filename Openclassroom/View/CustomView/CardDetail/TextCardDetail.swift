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

    lazy var scrollView: UIScrollView = UIScrollView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTitle()
        setupImage()
        setupContent()
        setupContainer()
    
        self.addSubview(scrollView)
        
        scrollView.addSubview(title)
        scrollView.addSubview(content)
        scrollView.addSubview(imageView)
        scrollView.addSubview(finishButton)
        scrollView.addSubview(socialContent)
        
        let width = UIScreen.mainScreen().bounds.width
        
        /**
         *  Add scrollview constraints
         */
        constrain(scrollView, self) {
            scroll, container in
            scroll.edges == container.edges
            scroll.width == width
        }
        
        constrain(title, imageView, content, scrollView, finishButton) {
            title, image, content, container, button in
            image.top == container.top
            image.trailing == container.trailing
            image.leading == container.leading
            image.height == 135
            image.width == width
            
            title.top == image.bottom + 20
            title.leading == container.leading + 20
            title.trailing == container.trailing - 20
            
            button.bottom == container.bottom - 30
            button.leading == container.leading + 30
            button.trailing == container.trailing - 30
            button.height == 44
            
            content.top == title.bottom + 40
            content.leading == container.leading + 20
            content.trailing == container.trailing - 20
            content.bottom == button.top - 100
        }
        
        /**
         *  Add social block constraints
         */
        constrain(finishButton, socialContent, content, scrollView) {
            finish, social, content, container in
        
            social.bottom == finish.top
            social.height == 111
            social.leading == container.leading
            social.trailing == container.trailing
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupContainer() {
        scrollView.backgroundColor = UIColor.whiteColor()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    private func setupTitle() {
        title.font = UIFont.boldSystemFontOfSize(24.0)
        title.textColor = UIColor.OCGreyishBrownColor()
        title.textAlignment = .Center
        title.numberOfLines = 0
        title.text = "Card's title"
    }
    
    private func setupContent() {
        content.scrollEnabled = false
        content.backgroundColor = .None
        content.textAlignment = .Justified
        content.editable = false
        content.selectable = false
    }
    
    private func setupImage() {
        imageView.image = UIImage(named: "Card Content Image")
        imageView.contentMode = .ScaleAspectFill
    }
    
}

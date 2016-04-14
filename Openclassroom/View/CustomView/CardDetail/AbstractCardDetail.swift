//
//  AbstractCardDetail.swift
//  Openclassroom
//
//  Created by Paul on 10/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

protocol CardDetail {
    func setupContent(card: Card)
}

class AbstractCardDetail: UIView, CardDetail {

    lazy var title: UILabel = UILabel()
    lazy var content: UITextView = UITextView()
    lazy var imageView: UIImageView = UIImageView()
    lazy var finishButton: UIButton = UIButton()
    lazy var socialContent: UIView = SocialContentView()
    
    var delegate: CardDetailControllerDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
        backgroundColor = UIColor.OCWhiteColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContent(card: Card) {
        title.text = card.title
        
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 15
        
        let cardContent = NSMutableAttributedString(string: card.content)
        cardContent.addAttribute(NSParagraphStyleAttributeName, value: style, range: NSMakeRange(0, cardContent.length))
        
        content.attributedText = cardContent
        content.font = UIFont.systemFontOfSize(16.0)
        content.textAlignment = .Justified
    }
    
    private func setupButton() {
        finishButton.setTitle("Terminer", forState: .Normal)
        finishButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        finishButton.titleLabel?.textAlignment = .Center
        finishButton.titleLabel?.font = UIFont.systemFontOfSize(16.0, weight: 0.2)
        finishButton.OCdefaultButton(UIColor.OCDustyOrangeColor())
        
        finishButton.addTarget(self, action: #selector(self.triggerFinish), forControlEvents: .TouchUpInside)
    }
    
    func triggerFinish() {
        delegate.finish()
    }
}

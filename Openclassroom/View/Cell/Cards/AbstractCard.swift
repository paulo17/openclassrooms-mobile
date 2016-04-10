//
//  AbstractCard.swift
//  Openclassroom
//
//  Created by Paul on 06/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import Cartography

protocol CardProtocol {
    
    // MARK: - IBOutlet
    
    var title: UILabel! { get set }
    var subtitle: UILabel! { get set }
    var imageView: UIImageView! { get set }
    var percentage: UILabel! { get set }
    var startButton: UIButton! { get set }
    var downloadButton: UIButton! { get set }
    
    // MARK: - CardController Delegate
    
    var indexPath: NSIndexPath! { get set }
    var delegate: CardControllerDelegate! { get set }
    
    // MARK: - Func
    
    static func cellIdentifier() -> String
    func setup() -> Void
    func content(card: Card) -> Void
}

class AbstractCard: UICollectionViewCell {
    
    var containerView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupContainer()
    }
    
    /**
     Get card icon image path
     
     - parameter card: instance of card
     
     - returns: name of the image
     */
    func cardImagePath(card: Card) -> String {
        return card.cardType == .Disable ?
            "\(card.type.rawValue)DisableIcon" :
            "\(card.type.rawValue)Icon"
    }
    
    /**
     Setup card container UIView with margin left and right of 30
     */
    private func setupContainer() {
        containerView = UIView()
        containerView.backgroundColor = UIColor.whiteColor()
        
        // add border shadow
        containerView.layer.masksToBounds = false
        containerView.layer.shadowColor = UIColor.blackColor().CGColor
        containerView.layer.shadowOffset = CGSizeMake(0.0, 1.0);
        containerView.layer.shadowOpacity = 0.1;
        
        self.addSubview(containerView)
        
        constrain(containerView, self) {
            containerView, cell in
            containerView.top == cell.top
            containerView.bottom == cell.bottom
            containerView.leading == cell.leading + 30
            containerView.trailing == cell.trailing - 30
        }
    }
}

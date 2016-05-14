//
//  CardDetailViewController.swift
//  Openclassroom
//
//  Created by Paul on 10/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

protocol CardDetailControllerDelegate {
    func finish()
}

class CardDetailViewController: UIViewController, CardDetailControllerDelegate {
    
    // MARK: - Variables from CardViewController
    
    var card: Card!
    var cell: CardProtocol!
    
    // MARK : - Other instance variables
    
    var delegate: CardViewController!
    var cardDetailView: AbstractCardDetail!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardDetailView = instianciateCardDetailView()
        cardDetailView.delegate = self
        cardDetailView.setupContent(card)
        
        self.view = cardDetailView
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Jour 1 sur 20"
    }
    
    /**
     Instanciate the correct custom view for card type
     
     - returns: AbstractCardDetail
     */
    func instianciateCardDetailView() -> AbstractCardDetail {
        if let currentCard = card {
            switch currentCard.type {
            case .Text:
                return TextCardDetail()
            case .Video:
                return VideoCardDetail()
            default:
                break
            }
        }
        
        return AbstractCardDetail()
    }
    
    // MARK: - CardDetailController Delegate
    
    func finish() {
        card.cardStatus = .Done
        
        delegate.finishCallback(sender: self) // launch callback
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK: - Navigation
    
    /**
     Change progress bar state when user back to the card's list
     
     - parameter parent: UIViewController parent
     */
    override func willMoveToParentViewController(parent: UIViewController?) {
        if parent == nil && card.cardStatus == .InProgress {
            cell.circleContainer.circularProgressBar.progress = 0.35
        }
    }
}

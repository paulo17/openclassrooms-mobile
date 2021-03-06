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
    
    // MARK: - Other instance variables
    
    weak var delegate: CardViewController!
    var cardDetailView: AbstractCardDetail!
    
    // MARK: - UI Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardDetailView = instianciateCardDetailView()
        cardDetailView.delegate = self
        cardDetailView.setupContent(card)
        
        self.view = cardDetailView
        
        let account = UIImage(named: "account")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: account, style: .Plain, target: self, action: #selector(CardDetailViewController.showProfile))
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
    
    // MARK: - Navigation bar actions
    
    func showProfile() {
        self.navigationItem.title = "" // remove back button title for profile view
        let cardStoryboard = UIStoryboard(name: "Cards", bundle: nil)
        let profileViewController = cardStoryboard.instantiateViewControllerWithIdentifier("ProfileViewController")
        presentViewController(profileViewController, animated: true, completion: nil)
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

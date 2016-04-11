//
//  CardDetailViewController.swift
//  Openclassroom
//
//  Created by Paul on 10/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class CardDetailViewController: UIViewController {
    
    var card: Card!
    
    var cardDetailView: AbstractCardDetail!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardDetailView = instianciateCardDetailView()
        cardDetailView.setupContent(card)
        
        self.view = cardDetailView
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "Jour 1 sur 20"
    }
    
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
}

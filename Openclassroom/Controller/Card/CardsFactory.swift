//
//  CardsFactory.swift
//  Openclassroom
//
//  Created by Paul on 06/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class CardsFactory {
    
    static func createCard(type: CardsType, collection: UICollectionView, indexPath: NSIndexPath) -> CardProtocol? {
        let card: CardProtocol!
        
        switch type {
        case .Start:
            card = collection.dequeueReusableCellWithReuseIdentifier(StartCell.cellIdentifier(), forIndexPath: indexPath) as! StartCell
        case .Active:
            card = collection.dequeueReusableCellWithReuseIdentifier(ActiveCell.cellIdentifier(), forIndexPath: indexPath) as! ActiveCell
        case .Disable:
            card = collection.dequeueReusableCellWithReuseIdentifier(DisableCell.cellIdentifier(), forIndexPath: indexPath) as! DisableCell
        case .Finish:
            card = collection.dequeueReusableCellWithReuseIdentifier(FinishCell.cellIdentifier(), forIndexPath: indexPath) as! FinishCell
        }
        
        card.setup()
        
        return card
    }
}

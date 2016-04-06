//
//  CardsFactory.swift
//  Openclassroom
//
//  Created by Paul on 06/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class CardsFactory {
    
    static func createCard(type: CardsType, collection: UICollectionView, indexPath: NSIndexPath) -> UICollectionViewCell? {
        switch type {
        case .Start:
            return collection.dequeueReusableCellWithReuseIdentifier("StartCell", forIndexPath: indexPath) as! StartCell
        case .Active:
            return collection.dequeueReusableCellWithReuseIdentifier("ActiveCell", forIndexPath: indexPath) as! ActiveCell
        case .Disable:
            return collection.dequeueReusableCellWithReuseIdentifier("DisableCell", forIndexPath: indexPath) as! DisableCell
        case .Finish:
            return collection.dequeueReusableCellWithReuseIdentifier("FinishCell", forIndexPath: indexPath) as! FinishCell
        }
    }
}

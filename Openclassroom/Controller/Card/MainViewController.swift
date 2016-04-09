//
//  MainViewController.swift
//  Openclassroom
//
//  Created by Paul on 02/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var tasksCollectionView: UICollectionView!
    
    lazy var cards: [Card] = [Card]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasksCollectionView.delegate = self
        tasksCollectionView.dataSource = self
        registerCustomCell()
        
        self.cards = getStaticLecons()
    }
    
    override func viewWillAppear(animated: Bool) {
        tasksCollectionView.pagingEnabled = true
    }
    
    /**
     Register Custom Card Cell
     */
    private func registerCustomCell() {
        tasksCollectionView.registerClass(ActiveCell.self, forCellWithReuseIdentifier: ActiveCell.cellIdentifier())
        tasksCollectionView.registerClass(StartCell.self, forCellWithReuseIdentifier: StartCell.cellIdentifier())
        tasksCollectionView.registerClass(DisableCell.self, forCellWithReuseIdentifier: DisableCell.cellIdentifier())
        tasksCollectionView.registerClass(FinishCell.self, forCellWithReuseIdentifier: FinishCell.cellIdentifier())
    }
    
    func getStaticLecons() -> [Card] {
        var lecons: [Card] = [Card]()
        for leconData in Card.lecons {
            let type = LeconType.stringToEnum(leconData["type"] as! String)
            let cardType = CardType.stringToEnum(leconData["card"] as! String)
            
            let lecon = Card(
                title: leconData["title"] as! String,
                time: leconData["time"] as! Int,
                type: type,
                cardType: cardType,
                status: leconData["status"] as! Bool)
            
            lecons.append(lecon)
        }
        
        return lecons
    }
    
    
    // MARK: - Collection view
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let currentCard = cards[indexPath.row]
        let cell = CardsFactory.createCard(currentCard.cardType, collection: collectionView, indexPath: indexPath)!
        
        cell.setup()
        //cell.title.text = lecons[indexPath.row].title
                
        return cell as! UICollectionViewCell
    }
    
    // MARK: - CollectionView Flow Delegate
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(tasksCollectionView.bounds.width, tasksCollectionView.bounds.height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
}

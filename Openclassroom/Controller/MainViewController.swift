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
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private let cellIdentifier = "leconCell"
    lazy var lecons: [Lecon] = [Lecon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lecons = getStaticLecons()
    }
    
    override func viewWillAppear(animated: Bool) {
        tasksCollectionView.pagingEnabled = true
        startButton.OCdefaultButton(UIColor.whiteColor())
    }
    
    func getStaticLecons() -> [Lecon] {
        var lecons: [Lecon] = [Lecon]()
        for leconData in Lecon.lecons {
            let type = Lecon.parseStringTypeToEnum(leconData["type"] as! String)
            let lecon = Lecon(
                title: leconData["title"] as! String,
                time: leconData["time"] as! Int,
                type: type,
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
        pageControl.numberOfPages = lecons.count // set page control number to the number of element in collection view
        return lecons.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        pageControl.currentPage = indexPath.row // set current page control to current item index
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! LeconCell
        cell.initializeCellWithContent(lecons[indexPath.row])
        
        return cell
    }
    
    // remove spacing between page of cell
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    // MARK: - Scroll view delegate
    
    /*
    func pageControlDidTouch() {
    let pageWidth: CGFloat = tasksCollectionView.frame.size.width
    let scrollTo: CGPoint  = CGPointMake(pageWidth * CGFloat(pageControl.currentPage), 0)
    
    tasksCollectionView.setContentOffset(scrollTo, animated: true)
    }*/
    
    
    
    
}

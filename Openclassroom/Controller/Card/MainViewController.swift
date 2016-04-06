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
    
    private let cellIdentifier = "leconCell"
    lazy var lecons: [Lecon] = [Lecon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasksCollectionView.delegate = self
        tasksCollectionView.dataSource = self
        
        self.lecons = getStaticLecons()
    }
    
    override func viewWillAppear(animated: Bool) {
        tasksCollectionView.pagingEnabled = true
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
        return lecons.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! LeconCell
        
        /*let view = UIView(frame: CGRectMake(0.0, 30.0, tasksCollectionView.bounds.size.width, tasksCollectionView.bounds.size.height))
        view.backgroundColor = UIColor.whiteColor()
        
        cell.addSubview(view)*/
        
        cell.backgroundColor = UIColor.redColor()
        
        print(cell)
        
        //cell.initializeCellWithContent(lecons[indexPath.row])
        
        return cell
    }
    
    // remove spacing between page of cell
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 30.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(tasksCollectionView.bounds.width - 60.0, tasksCollectionView.bounds.height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 30.0, bottom: 0.0, right: 30.0)
    }
    
    // MARK: - Scroll view delegate
    
    /*
    func pageControlDidTouch() {
    let pageWidth: CGFloat = tasksCollectionView.frame.size.width
    let scrollTo: CGPoint  = CGPointMake(pageWidth * CGFloat(pageControl.currentPage), 0)
    
    tasksCollectionView.setContentOffset(scrollTo, animated: true)
    }*/
    
    
    
    
}

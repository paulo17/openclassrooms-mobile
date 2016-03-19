//
//  CategoryViewController.swift
//  Openclassroom
//
//  Created by Paul on 16/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var validateButton: UIButton!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    let categoryCellIdentifier = "categoryCell"
    lazy var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.categories = getStaticCategory()
    }
    
    override func viewWillAppear(animated: Bool) {
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    func getStaticCategory() -> [Category] {
        var categories = [Category]()
        
        for category in Category.categories {
            categories.append(Category(name: category["name"]!, image: category["image"]!))
        }
        
        return categories
    }
    
    // MARK: - UICollectionView
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(categoryCellIdentifier, forIndexPath: indexPath) as! CategoryCell
        
        let category = categories[indexPath.row]
        cell.initializeCellWithContent(category)
        
        return cell
    }
}

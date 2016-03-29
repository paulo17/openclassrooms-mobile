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
    var selectedCategory: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        validateButton.OCdefaultButton(UIColorFromRGBA("ceced2"))
        
        self.categories = getStaticCategory()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = "Etape 1 sur 3"
    }
    
    func getStaticCategory() -> [Category] {
        var categories = [Category]()
        
        for (index, category) in Category.categories.enumerate() {
            categories.append(Category(id: index, name: category["name"]!, image: category["image"]!))
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
        
        if let selected = selectedCategory {
            cell.initializeCellWithContent(current: category, selected: selected)
        } else {
            cell.initializeCellWithContent(category)
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let selectedCell = collectionView.cellForItemAtIndexPath(indexPath) as! CategoryCell
        selectedCell.categoryImage.alpha = 1.0
        
        validateButton.OCdefaultButton(UIColorFromRGBA("F39539"))
        selectedCategory = categories[indexPath.row]
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let selectedCell = collectionView.cellForItemAtIndexPath(indexPath) as! CategoryCell
        selectedCell.categoryImage.alpha = 0.5
        
        validateButton.OCdefaultButton(UIColor.OCSilverTwoColor())
        selectedCategory = nil
    }
    
    // MARK: - Navigation
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "categoryToObjective" {
            guard (selectedCategory != nil) else {
                return false
            }
        }
        
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "categoryToObjective" {
            navigationItem.title = "" // remove navigation title
            
            let objectiveController = segue.destinationViewController as! ObjectiveViewController
            objectiveController.category = selectedCategory
        }
    }
}

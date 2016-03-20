//
//  CategoryCell.swift
//  Openclassroom
//
//  Created by Paul on 19/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    func initializeCellWithContent(category: Category) {
        categoryName.text = category.name
        
        if let imageIcon = UIImage(named: category.image) {
            categoryImage.alpha = 0.5
            categoryImage.image = imageIcon
        }
    }
    
    func initializeCellWithContent(current category: Category, selected selectedCategory: Category) {
        self.initializeCellWithContent(category)
        
        if category.id == selectedCategory.id {
            categoryImage.alpha = 1.0
            self.selected = true
        }
    }
}

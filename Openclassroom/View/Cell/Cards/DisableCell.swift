//
//  DisableCell.swift
//  Openclassroom
//
//  Created by Paul on 06/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class DisableCell: AbstractCard, CardProtocol {
    
    var title: UILabel!
    var subtitle: UILabel!
    var imageView: UIImageView!
    var percentage: UILabel!
    var startButton: UIButton!
    var downloadButton: UIButton!
    
    static func cellIdentifier() -> String {
        return "DisableCell"
    }
    
    func setup() -> Void {
        
    }
}

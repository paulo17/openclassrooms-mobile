//
//  Lecon.swift
//  Openclassroom
//
//  Created by Paul on 09/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

class Lecon {
    
    var title: String
    
    static let lecons = [
        ["title": "Introduction"],
        ["title": "Qu'est ce que le web ?"],
        ["title": "Web, services et Cloud"],
        ["title": "Comment est né le web ?"],
    ]
    
    init(title: String) {
        self.title = title
    }
    
}

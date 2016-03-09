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
    var time: Int
    
    static let lecons = [
        ["title": "Introduction", "time": 5],
        ["title": "Qu'est ce que le web ?", "time": 15],
        ["title": "Web, services et Cloud", "time": 12],
        ["title": "Comment est né le web ?", "time": 10],
    ]
    
    init(title: String, time: Int) {
        self.title = title
        self.time = time
    }
    
}

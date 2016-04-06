//
//  Lecon.swift
//  Openclassroom
//
//  Created by Paul on 09/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

enum CardsType {
    case Start
    case Active
    case Disable
    case Finish
}

enum LeconType {
    case Video, Text, Quizz, Reward
}

class Card {
    
    var title: String
    var time: Int
    var type: LeconType
    var status: Bool
    
    static let lecons = [
        ["title": "Introduction", "time": 5, "type": "Video", "status": true],
        ["title": "Qu'est ce que le web ?", "time": 15, "type": "Text", "status": false],
        ["title": "Web, services et Cloud", "time": 12, "type": "Quizz", "status": false],
        ["title": "Comment est né le web ?", "time": 10, "type": "Reward", "status": false],
    ]
    
    static func parseStringTypeToEnum(type: String) -> LeconType {
        let typeEnum : LeconType
        
        switch type {
        case "Video": typeEnum = .Video
        case "Text": typeEnum = .Text
        case "Quizz": typeEnum = .Quizz
        case "Reward": typeEnum = .Reward
        default: typeEnum = .Video
        }
        
        return typeEnum
    }
    
    init(title: String, time: Int, type: LeconType, status: Bool = false) {
        self.title = title
        self.time = time
        self.type = type
        self.status = status
    }
    
}

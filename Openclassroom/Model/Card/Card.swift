//
//  Lecon.swift
//  Openclassroom
//
//  Created by Paul on 09/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit

enum CardType: String {
    case Start = "Start"
    case Active = "Active"
    case Disable = "Disable"
    case Finish = "Finish"
    
    static func stringToEnum(type: String) -> CardType {
        if let type = CardType(rawValue: type) {
            return type
        }
        
        return .Active
    }
}

enum LeconType: String {
    case Video = "Video"
    case Text = "Text"
    case Quizz = "Quizz"
    case Reward = "Reward"
    
    static func stringToEnum(type: String) -> LeconType {
        if let type = LeconType(rawValue: type) {
            return type
        }
        
        return .Text
    }
}

class Card {
    
    var title: String
    var time: Int
    var type: LeconType
    var cardType: CardType
    var status: Bool
    
    static let lecons = [
        ["title": "Jour 1 sur 20", "time": 0, "type": "", "status": true, "card": "Start"],
        ["title": "Introduction", "time": 5, "type": "Video", "status": true, "card": "Active"],
        ["title": "Qu'est ce que le web ?", "time": 15, "type": "Text", "status": false, "card": "Disable"],
        ["title": "Web, services et Cloud", "time": 12, "type": "Quizz", "status": false, "card": "Disable"],
        ["title": "Comment est né le web ?", "time": 10, "type": "Reward", "status": false, "card": "Disable"],
        ["title": "Journée non terminée", "time": 0, "type": "", "status": false, "card": "Finish"]
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
    
    
    init(title: String, time: Int, type: LeconType, cardType: CardType, status: Bool = false) {
        self.title = title
        self.time = time
        self.type = type
        self.status = status
        self.cardType = cardType
    }
    
}

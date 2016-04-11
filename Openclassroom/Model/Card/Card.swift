//
//  Lecon.swift
//  Openclassroom
//
//  Created by Paul on 09/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import SwiftyJSON

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
    case None = "None"
    
    static func stringToEnum(type: String) -> LeconType {
        if let type = LeconType(rawValue: type.capitalizedString) {
            return type
        }
        
        return .Text
    }
}

class Card {
    
    var id: Int
    var title: String
    var subtitle: String?
    var time: Int
    var type: LeconType
    var cardType: CardType
    var content: String
    
    static func getData() -> JSON? {
        if let path = NSBundle.mainBundle().pathForResource("cards", ofType: "json") {
            if let data = NSData(contentsOfFile: path) {
                return JSON(data: data)
            }
        }
        
        return nil
    }
    
    init(id: Int, title: String, time: Int, type: LeconType, cardType: CardType, content: String = "") {
        self.id = id
        self.title = title
        self.time = time
        self.type = type
        self.cardType = cardType
        self.content = content
    }
    
}

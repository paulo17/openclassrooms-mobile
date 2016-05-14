//
//  Day.swift
//  Openclassroom
//
//  Created by Paul on 02/04/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import Foundation
import UIKit

enum DaysOfWeek: String {
    case Monday = "Lundi"
    case Tuesday = "Mardi"
    case Wednesday = "Mercredi"
    case Thursday = "Jeudi"
    case Friday = "Vendredi"
    case Saturday = "Samedi"
    case Sunday = "Dimanche"
    
    static let days = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
}

struct Days {
    static let monday = UInt32(1 << 0)
    static let tuesday = UInt32(1 << 1)
    static let wednesday = UInt32(1 << 2)
    static let thursday = UInt32(1 << 3)
    static let friday = UInt32(1 << 4)
    static let saturday = UInt32(1 << 5)
    static let sunday = UInt32(1 << 6)
    
    static func transform(days: [String]) -> UInt32 {
        var daysBinary: UInt32 = 0
        
        days.forEach { (day) in
            switch day {
            case DaysOfWeek.Monday.rawValue:
                daysBinary += self.monday
                break
            case DaysOfWeek.Tuesday.rawValue:
                daysBinary += self.tuesday
                break
            case DaysOfWeek.Wednesday.rawValue:
                daysBinary += self.wednesday
                break
            case DaysOfWeek.Thursday.rawValue:
                daysBinary += self.thursday
                break
            case DaysOfWeek.Friday.rawValue:
                daysBinary += self.friday
                break
            case DaysOfWeek.Saturday.rawValue:
                daysBinary += self.saturday
                break
            case DaysOfWeek.Sunday.rawValue:
                daysBinary += self.sunday
                break
            default:
                break
            }
        }
        
        return daysBinary
    }
    
    static func reverse(days: UInt32) -> [String] {
        
        
        
        return [String]()
    }
    
    static func humanReadable(days: [String]) -> String {
        let daysBinary = transform(days)
        
        if daysBinary == 96 {
            return "Week-end"
        }
        
        if daysBinary == 31 {
            return "En Semaine"
        }
        
        if daysBinary == 127 {
            return "Tous les jours"
        }
        
        return days.joinWithSeparator(", ")
    }
}

//
//  User.swift
//  Openclassroom
//
//  Created by Paul on 15/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import CoreData

class User: OCManagedObject {
    
    @NSManaged var firstname: String?
    @NSManaged var lastname: String?
    @NSManaged var email: String?
    @NSManaged var password: String?
    
    @NSManaged var category: String?
    @NSManaged var objective: String?
    @NSManaged var days: NSNumber?
    @NSManaged var time: String?
    
    var daysOfWeek: [Int: String]!
    
    override static func entityName() -> String {
        return "User"
    }
}

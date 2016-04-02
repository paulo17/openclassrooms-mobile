//
//  UserManager.swift
//  Openclassroom
//
//  Created by Paul on 28/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import CoreData

class UserManager<Entity: User>: OCAbstractManager<User> {
    
    static func createUser(email: String, password: String) -> User {
        let user = createObject()
        user.email = email
        user.password = password
        
        self.saveContext()
        
        return user
    }
    
    static func authenticateUser(email: String, password: String) -> User? {
        let entityDescription = NSEntityDescription.entityForName(User.entityName(), inManagedObjectContext: managedObjectContext)
        
        // initialize request
        let request = NSFetchRequest()
        request.entity = entityDescription
        
        // add predicate
        let predicateEmail = NSPredicate(format: "email = %@", email)
        let predicatePassword = NSPredicate(format: "password = %@", password)
        request.predicate = NSCompoundPredicate(type: .AndPredicateType, subpredicates: [predicateEmail, predicatePassword])
        
        // execute request
        do {
            let results = try managedObjectContext.executeFetchRequest(request)
            return results.first as? User
        } catch let error as NSError {
            print(error)
        }
        
        return nil
    }
}

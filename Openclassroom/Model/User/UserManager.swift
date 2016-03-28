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
}

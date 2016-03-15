//
//  User.swift
//  Openclassroom
//
//  Created by Paul on 15/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

class User {
    
    var email: String
    
    var firstname: String?
    var lastname: String?
    
    static var users = [
        ["email": "paulboiseau@gmail.com", "firstname": "Paul", "lastname": "Boiseau"]
    ]
    
    init(email: String) {
        self.email = email
    }
}

//
//  Category.swift
//  Openclassroom
//
//  Created by Paul on 19/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

class Category {
    
    var name: String
    var image: String
    
    static let categories = [
        ["name": "Initiation numérique", "image": "initiation-numerique"],
        ["name": "Design", "image": "design"],
        ["name": "Do it yourself", "image": "do-it-yourself"],
        ["name": "Dev perso", "image": "dev-perso"],
        ["name": "Dev entreprise", "image": "dev-entreprise"],
        ["name": "Dev mobile", "image": "dev-mobile"],
        ["name": "Marketing digital", "image": "marketing-digital"],
        ["name": "Gestion de projet", "image": "gestion-de-projet"],
        ["name": "Developpement", "image": "developpement"]
    ]
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}

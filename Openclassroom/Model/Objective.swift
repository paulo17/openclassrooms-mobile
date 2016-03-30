//
//  Objective.swift
//  Openclassroom
//
//  Created by Paul on 21/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

class Objective {
    
    var id: Int
    var name: String
    
    static let objectives = [
        ["name": "Découvrez les solutions CMS"],
        ["name": "Protégez l’ensemble de vos communications  sur Internet"],
        ["name": "Comprendre le web"],
        ["name": "Tout sur les réseaux et Internet"],
        ["name": "Protégez l’ensemble de vos communications sur Internet"],
        ["name": "Analyser des données avec Excel"],
        ["name": "Apprendre le HTML"]
    ]
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

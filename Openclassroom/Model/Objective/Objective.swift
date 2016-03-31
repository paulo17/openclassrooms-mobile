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
    var duration: Int
    
    static let objectives = [
        ["name": "Découvrez les solutions CMS", "duration": "72"],
        ["name": "Protégez l’ensemble de vos communications  sur Internet", "duration": "24"],
        ["name": "Comprendre le web", "duration": "45"],
        ["name": "Tout sur les réseaux et Internet", "duration": "12"],
        ["name": "Protégez l’ensemble de vos communications sur Internet", "duration": "24"],
        ["name": "Analyser des données avec Excel", "duration": "8"],
        ["name": "Apprendre le HTML", "duration": "15"]
    ]
    
    init(id: Int, name: String, duration: Int) {
        self.id = id
        self.name = name
        self.duration = duration
    }
}

//
//  Array.swift
//  Openclassroom
//
//  Created by Paul on 27/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

extension Array {
    
    func arrayContainsElements<S : SequenceType where S.Generator.Element : Equatable>
        (src:S, lookFor:S) -> Bool {
        
        for v:S.Generator.Element in lookFor {
            if !src.contains(v) {
                return false
            }
        }
        
        return true
    }
    
}

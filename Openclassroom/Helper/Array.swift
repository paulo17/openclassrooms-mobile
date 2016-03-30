//
//  Array.swift
//  Openclassroom
//
//  Created by Paul on 27/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

extension Array {
    
    func contains<T where T : Equatable>(obj: T) -> Bool {
        return self.filter({$0 as? T == obj}).count > 0
    }
    
    mutating func removeObject<U: Equatable>(object: U) {
        var index: Int?
        for (idx, objectToCompare) in self.enumerate() {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        
        if (index != nil) {
            self.removeAtIndex(index!)
        }
    }

    
}

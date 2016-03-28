//
//  OCAbstractManager.swift
//  Openclassroom
//
//  Created by Paul on 28/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import UIKit
import CoreData

class OCAbstractManager<Entity: OCManagedObject> {
    
    // MARK: - CRUD Core Data
    
    class func createObject() -> Entity {
        let entityDescription = NSEntityDescription.entityForName(Entity.entityName(), inManagedObjectContext: managedObjectContext)
        
        let object = OCManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext) as! Entity
        
        return object
    }
    
    static func deleteObject(object: Entity, saveContext: Bool = true) {
        managedObjectContext.deleteObject(object)
        self.saveContext()
    }
    
    // MARK: - Core Data Accessor
    
    static func objects() -> [Entity] {
        let entityDescription = NSEntityDescription.entityForName(Entity.entityName(), inManagedObjectContext: managedObjectContext)
                
        // initialize request
        let request = NSFetchRequest()
        request.entity = entityDescription
        
        // execute request
        do {
            let results = try managedObjectContext.executeFetchRequest(request)
            return results as! [Entity]
        } catch let error as NSError {
            print(error)
        }
        
        return []
    }

    
    // MARK: - Managed Object Context
    
    static var managedObjectContext: NSManagedObjectContext {
        return (UIApplication.sharedApplication().delegate
            as! AppDelegate).managedObjectContext
    }
    
    static var persistentStoreCoordinator: NSPersistentStoreCoordinator {
        return (UIApplication.sharedApplication().delegate
            as! AppDelegate).persistentStoreCoordinator
        
    }
    
    static func saveContext () {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

}

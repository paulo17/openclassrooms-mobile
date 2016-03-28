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
    
    class func createObject() -> Entity {
        let entityDescription = NSEntityDescription.entityForName(Entity.entityName(), inManagedObjectContext: managedObjectContext)
        
        let object = OCManagedObject(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext) as! Entity
        
        return object
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
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
                abort()
            }
        }
    }

}

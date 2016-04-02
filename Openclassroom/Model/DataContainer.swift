//
//  DataContainer.swift
//  Openclassroom
//
//  Created by Paul on 28/03/2016.
//  Copyright © 2016 paulboiseau. All rights reserved.
//

import Foundation
import UIKit

class DataContainer {
    static let sharedDataContainer = DataContainer()
    
    var currentUser: User!
    
    var goToBackgroundObserver: AnyObject?
    
    private init()
    {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        currentUser = defaults.objectForKey("User") as! User?
        
        //Add an obsever for the UIApplicationDidEnterBackgroundNotification.
        //When the app goes to the background, the code block saves our properties to NSUserDefaults.
        goToBackgroundObserver = NSNotificationCenter.defaultCenter().addObserverForName(
            UIApplicationDidEnterBackgroundNotification,
            object: nil,
            queue: nil)
        {
            (note: NSNotification!) -> Void in
            
            let defaults = NSUserDefaults.standardUserDefaults()
            
            defaults.setObject(self.currentUser, forKey: "User")
        
            //Tell NSUserDefaults to save to disk now.
            defaults.synchronize()
        }
    }
}

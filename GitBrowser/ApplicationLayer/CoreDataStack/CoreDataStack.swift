//
//  CoreDataStack.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 06.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import CoreData

class CoreDataStack {
    
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "GitBrowser")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    static func saveContext () throws {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                throw error
            }
        }
    }
    
}

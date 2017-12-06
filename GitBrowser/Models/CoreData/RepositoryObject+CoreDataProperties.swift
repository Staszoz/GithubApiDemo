//
//  RepositoryObject+CoreDataProperties.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 03.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import Foundation
import CoreData


extension RepositoryObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RepositoryObject> {
        return NSFetchRequest<RepositoryObject>(entityName: "RepositoryObject")
    }
    
    @NSManaged public var uid: Int32
    @NSManaged public var name: String
    @NSManaged public var isViewed: Bool
    @NSManaged public var url: String?
    @NSManaged public var starsCount: Int32
    @NSManaged public var descriptionInfo: String?

}

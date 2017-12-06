//
//  RepositoryObject+CoreDataClass.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 03.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import Foundation
import CoreData


public class RepositoryObject: NSManagedObject {
    
    convenience init?(repositoryPlainModel: RepositoryPlainModel, insertInto context: NSManagedObjectContext) {
        guard let entity = NSEntityDescription.entity(forEntityName: "RepositoryObject", in: context) else { return nil }
        self.init(entity: entity, insertInto: context)
        self.uid = Int32(repositoryPlainModel.id)
        self.name = repositoryPlainModel.name
        self.starsCount = Int32(repositoryPlainModel.starsCount)
        self.url = repositoryPlainModel.url
        self.isViewed = false
        self.descriptionInfo = repositoryPlainModel.description
    }
}

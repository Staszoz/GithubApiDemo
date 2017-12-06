//
//  RepositoriesCachedService.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 03.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import UIKit
import CoreData

final class RepositoriesCachedServiceImpl: RepositoriesCachedService {
    
    var persistentContainer: NSPersistentContainer = CoreDataStack.persistentContainer
    
    
    //MARK: - Public
    func fetchAll(completion: @escaping RepositoriesFetcherCompletion) {
        let managedContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<RepositoryObject>(entityName: "RepositoryObject")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "starsCount", ascending: false)]
        
        do {
            let repositories = try managedContext.fetch(fetchRequest)
            completion(repositories, nil)
            
        } catch {
            completion(nil, error)
        }
    }
    
    func save(repositories: [RepositoryPlainModel]) {
        let repoIds = repositories.flatMap{ Int32($0.id) }
        let duplicates = self.fetchBy(ids: repoIds)

        let newRepForSave = repositories.flatMap({ (rep) -> RepositoryPlainModel? in
            return !duplicates.contains(where: { $0.uid == rep.id }) ? rep : nil
        })

        let managedContext = persistentContainer.viewContext

        newRepForSave.forEach { repositoryPlainModel in
            _ = RepositoryObject(repositoryPlainModel: repositoryPlainModel, insertInto: managedContext)
        }
        
        do {
            try CoreDataStack.saveContext()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetchBy(ids: [Int32]) -> [RepositoryObject] {
        let managedContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<RepositoryObject>(entityName: "RepositoryObject")
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "starsCount", ascending: false)]
        fetchRequest.predicate = NSPredicate(format: "uid IN %@", ids)
        
        do {
            let repositories = try managedContext.fetch(fetchRequest)
            return repositories

        } catch {
            return []
        }
    }
    
    func markAsViewed(id: Int32) {
        guard let repository = fetchBy(ids: [id]).first else { return }
        repository.isViewed = true
        
        do {
            try persistentContainer.viewContext.save()
            
        } catch {
            return
        }
    }
}

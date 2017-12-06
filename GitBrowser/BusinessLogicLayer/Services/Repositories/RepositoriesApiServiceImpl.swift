//
//  RepositoriesService.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 03.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import UIKit

import CoreData

final class RepositoriesApiServiceImpl: RepositoriesApiService {
    
    lazy var repositoriesService = GithubApiLoader()
    lazy var repositoriesCachedService: RepositoriesCachedService = RepositoriesCachedServiceImpl()
    
    let itemsPerPage: Int
    let concurrentlyCountQueues: Int
    
    
    init(itemsPerPage: Int, concurrentQueues: Int) {
        self.itemsPerPage = itemsPerPage
        self.concurrentlyCountQueues = concurrentQueues
    }

    
    //MARK: - Public
    func getRepositories(searchText: String, offset: Int, completion: @escaping RepositoriesFetcherCompletion) {

        let firstQueuePage = offset/itemsPerPage + 1
        
        let group = DispatchGroup()
        var repositoriesDic: [Int : [RepositoryPlainModel]] = [:]
        
        for i in 1...concurrentlyCountQueues {
            getRepositoriesFromApi(searchText: searchText, page: firstQueuePage + i, dispatchGroup: group, completion: { repositories, error in
                switch (repositories, error) {
                case (let repositories, nil) where repositories != nil:
                    repositoriesDic[i] = repositories!
                    
                default:
                    completion(nil, error)
                }
            })
        }
        
        group.notify(queue: .global()) { [weak self] in
            var meargedRepositories: [RepositoryPlainModel] = []
            repositoriesDic.sorted(by: { $0.key < $1.key }).forEach{ meargedRepositories.append(contentsOf: $0.value) }
            completion(meargedRepositories, nil)
            
            self?.repositoriesCachedService.save(repositories: meargedRepositories)
        }
    }
    
    //MARK: - Private
    private func getRepositoriesFromApi(searchText: String, page: Int, dispatchGroup: DispatchGroup, completion: @escaping ([RepositoryPlainModel]?, Error?)->()) {
        dispatchGroup.enter()
        
        repositoriesService.searchRepositories(searchText: searchText, pagination: Pagination(page: page, itemsPerPage: itemsPerPage)) { repositories, error in
            completion(repositories, error)
            dispatchGroup.leave()
        }
    }
}

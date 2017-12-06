//
//  RepositoriesFetcherProtocol.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 03.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import Foundation

protocol RepositoriesApiService {
    typealias RepositoriesFetcherCompletion = ([RepositoryPlainModel]?, Error?)->()
    
    func getRepositories(searchText: String, offset: Int, completion: @escaping RepositoriesFetcherCompletion)
}


protocol RepositoriesCachedService {
    typealias RepositoriesFetcherCompletion = ([RepositoryObject]?, Error?)->()
    
    func fetchAll(completion: @escaping RepositoriesFetcherCompletion)
    func fetchBy(ids: [Int32]) -> [RepositoryObject]
    func save(repositories: [RepositoryPlainModel])
    func markAsViewed(id: Int32)
}




//
//  GithubApiDataLoader.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import Foundation


final class GithubApiLoader {
    
    typealias RepositoriesCompletion = ([RepositoryPlainModel]?, Error?) -> ()
    
    lazy var networkCommunicator = NetworkCommunicator()
    
    
    func searchRepositories(searchText: String, pagination: Pagination, completion: @escaping RepositoriesCompletion) {
        
        guard let url = URL(string: GithubApi.Endpoint.searchRepositories.path) else { return }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryItems = [
            URLQueryItem(name: GithubApi.ParamKey.searchTekt, value: searchText),
            URLQueryItem(name: GithubApi.ParamKey.sort, value: GithubApi.SortKey.stars),
            URLQueryItem(name: GithubApi.ParamKey.page, value: String(pagination.page)),
            URLQueryItem(name: GithubApi.ParamKey.perPage, value: String(pagination.itemsPerPage))
        ]
        components?.queryItems = queryItems
        
        guard let requestUrl = components?.url else {
            assert(true, "Failure with creating the request url")
            return
        }
        
        networkCommunicator.getRequest(url: requestUrl, headers: nil) { [weak self] result in
            switch result {
            case .success(let data):
                self?.handleOnSuccess(data: data, completion: completion)
                
            case .failure(let data, let error):
                self?.handleOnError(error: error, data: data, completion: completion)
            }
        }
    }
    
    
    //MARK: - Private
    private func handleOnSuccess(data: Data, completion: RepositoriesCompletion?) {
        let decoder = JSONDecoder()
        do {
            let gitResponse = try decoder.decode(GithubSearchResponse.self, from: data)
            completion?(gitResponse.items, nil)
            
        } catch {
            completion?(nil, error)
        }
    }
    
    private func handleOnError(error: Error?, data: Data?, completion: RepositoriesCompletion?) {
        if let _data = data {
            let decoder = JSONDecoder()
            do {
                let errorResponse = try decoder.decode(GithubErrorResponse.self, from: _data)
                completion?(nil, GithubErrorResponse.GitError.message(errorResponse.message))
                
            } catch {
                return
            }
            
        } else {
            completion?(nil, error)
        }
    }
}

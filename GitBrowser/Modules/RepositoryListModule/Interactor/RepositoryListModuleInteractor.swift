//
//  RepositoryListModuleInteractor.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import UIKit

class RepositoryListModuleInteractor {

    weak var presenter: RepositoryListModulePresenterOutput?
    var repositoriesService: RepositoriesFetcher
    
    var isFetching = false
    var repositories: [RepositoryPlainModel] = []
    
    
    init(repositoriesService: RepositoriesFetcher) {
        self.repositoriesService = repositoriesService
    }
}

extension RepositoryListModuleInteractor: RepositoryListModuleInteractorProtocol {
    
    func getRepositories(searchText: String, offset: Int) {
        guard isFetching == false else { return }
        isFetching = true
        
        repositoriesService.getRepositories(searchText: searchText, offset: offset) { [weak self] (newRepositories, error) in
            guard let wSelf = self else { return }
            
            guard let _newRepositories = newRepositories else {
                switch error {
                case (let error as GithubErrorResponse.GitError) where (error.description != nil) :
                    wSelf.presenter?.showError(text: error.description!)
                    
                case (let error):
                    wSelf.presenter?.showError(text: error?.localizedDescription ?? "Error")
                }

                wSelf.isFetching = false
                return
            }
            
            let isFirstResponse = wSelf.repositories.isEmpty
            wSelf.repositories.append(contentsOf: _newRepositories)
            
            if isFirstResponse {
                let repositoriesViewModel = wSelf.repositories.map{ Repository(repositoryPlainModel: $0) }
                wSelf.presenter?.updateDataSource(repositories: repositoriesViewModel)
                
            } else {
                let repositoriesViewModel = _newRepositories.map{ Repository(repositoryPlainModel: $0) }
                wSelf.presenter?.insert(newRepositories: repositoriesViewModel, oldDataCount: offset)
            }
            
            wSelf.isFetching = false
        }
    }
    
    func willDisplayCell(index: Int, searchText: String) {
        if index >= repositories.count-1 {
            getRepositories(searchText: searchText, offset: repositories.count)
        }
    }
    
    func didDisplayLastCell(searchText: String) {
        getRepositories(searchText: searchText, offset: repositories.count)
    }
    
    func didSelectItem(index: Int) {
        if let urlStr = repositories[index].url, let url = URL(string: urlStr) {
            presenter?.openRepositoryDetail(url: url)
            
        } else {
            presenter?.showError(text: "Bad url")
        }
    }
}

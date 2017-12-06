//
//  RepositoryListModuleInteractor.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 04.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import UIKit

private let kBadUrlErrorMessage = "Bad url"
private let kMaxTextLength = 30

class RepositoryListModuleInteractor {

    //MARK: - Properties
    weak var output: RepositoryListModuleInteractorOutput?
    var repositoriesService: RepositoriesApiService
    
    var isFetching = false
    var repositories: [RepositoryPlainModel] = []
    
    
    init(repositoriesService: RepositoriesApiService) {
        self.repositoriesService = repositoriesService
    }
}

extension RepositoryListModuleInteractor: RepositoryListModuleInteractorInput {
    
    func getRepositories(searchText: String) {
        guard isFetching == false else { return }
        isFetching = true
        output?.showActivityIndicator()
        
        let offset = repositories.count
        
        repositoriesService.getRepositories(searchText: searchText, offset: offset) { [weak self] (newRepositories, error) in
            guard let wSelf = self else { return }
            
            guard let _newRepositories = newRepositories else {
                switch error {
                case (let error as GithubErrorResponse.GitError) where (error.description != nil) :
                    wSelf.output?.showError(text: error.description!)
                    
                case (let error):
                    wSelf.output?.showError(text: error?.localizedDescription ?? "Error")
                }
                wSelf.output?.hideActivityIndicator()
                wSelf.isFetching = false
                return
            }
            
            let isFirstResponse = wSelf.repositories.isEmpty
            wSelf.repositories.append(contentsOf: _newRepositories)
            
            if isFirstResponse {
                let repositoriesViewModel = wSelf.repositories.map{ Repository(repositoryPlainModel: $0, withTruncate: kMaxTextLength) }
                wSelf.output?.updateDataSource(repositories: repositoriesViewModel)
                
            } else {
                let repositoriesViewModel = _newRepositories.map{ Repository(repositoryPlainModel: $0, withTruncate: kMaxTextLength) }
                wSelf.output?.insert(newRepositories: repositoriesViewModel, oldDataCount: offset)
            }
            
            wSelf.output?.hideActivityIndicator()
            wSelf.isFetching = false
        }
    }
    
    func didSelectItem(index: Int) {
        if let urlStr = repositories[index].url, let url = URL(string: urlStr) {
            output?.openRepositoryDetail(url: url)
            
        } else {
            output?.showError(text: kBadUrlErrorMessage)
        }
    }
}

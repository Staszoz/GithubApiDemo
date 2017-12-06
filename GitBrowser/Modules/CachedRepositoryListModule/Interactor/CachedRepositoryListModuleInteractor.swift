//
//  CachedRepositoryListModuleInteractor.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 03.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import UIKit

class CachedRepositoryListModuleInteractor  {

    weak var presenter: CachedRepositoryListModuleInteractorOutputProtocol?
    var repositoriesService: RepositoriesFetcher
    
    var isFetching = false
    var repositories: [RepositoryPlainModel] = []
    
    
    init(repositoriesService: RepositoriesFetcher) {
        self.repositoriesService = repositoriesService
    }
}

extension CachedRepositoryListModuleInteractor: CachedRepositoryListModuleInteractorInputProtocol {
    
    func getRepositories() {
        
        repositoriesService.getRepositories(searchText: "", offset: 0) { [weak self] (newRepositories, error) in
            guard let wSelf = self else { return }
            
            guard let _newRepositories = newRepositories else {
                wSelf.presenter?.showError(text: error?.localizedDescription ?? "Error")
                return
            }
            
            wSelf.repositories.append(contentsOf: _newRepositories)
            let repositoriesViewModel = wSelf.repositories.map{ Repository(repositoryPlainModel: $0) }
            wSelf.presenter?.updateDataSource(repositories: repositoriesViewModel)
        }
    }
    
    func didSelectItem(index: Int) {
        if let urlStr = repositories[index].url, let url = URL(string: urlStr) {
//            presenter?.openRepositoryDetail(url: url)
            
        } else {
            presenter?.showError(text: "Bad url")
        }
    }
}
